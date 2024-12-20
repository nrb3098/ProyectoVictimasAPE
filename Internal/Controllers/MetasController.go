package controllers

import (
	"database/sql"
	"net/http"
	models "proyectoAPE/Internal/Models"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type MetaController struct {
	DB     *gorm.DB
	DB_ape *sql.DB
}

type Orientacion struct {
	ID                      uint   `gorm:"primaryKey" json:"id"`
	FechaPrimeraOrientacion string `gorm:"size:30" json:"fecha_primera_orientacion"`
}

type MonthlyCount struct {
	YearMonth string `json:"year_month"`
	Count     int    `json:"count"`
}
type RespuestaGrafico struct {
	Orientciones []MonthlyCount `json:"orientaciones"`
	Colocaciones []MonthlyCount `json:"colocados"`
	Inscritos    []MonthlyCount `json:"inscritos"`
}

// Crear una nueva meta
func (mc *MetaController) CreateMeta(c *gin.Context) {
	var meta models.Meta
	if err := c.ShouldBindJSON(&meta); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	if err := mc.DB.Create(&meta).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Error al crear la meta"})
		return
	}

	c.JSON(http.StatusCreated, gin.H{"data": meta})
}

// Obtener todas las metas
func (mc *MetaController) GetMetas(c *gin.Context) {
	var metas []models.Meta
	if err := mc.DB.Find(&metas).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Error al obtener las metas"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"data": metas})
}

// Obtener una meta por ID
func (mc *MetaController) GetMetaByID(c *gin.Context) {
	id := c.Param("id")
	var meta models.Meta

	if err := mc.DB.First(&meta, id).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Meta no encontrada"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"data": meta})
}

// Actualizar una meta
func (mc *MetaController) UpdateMeta(c *gin.Context) {
	id := c.Param("id")
	var meta models.Meta

	if err := mc.DB.First(&meta, id).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Meta no encontrada"})
		return
	}

	if err := c.ShouldBindJSON(&meta); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	if err := mc.DB.Save(&meta).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Error al actualizar la meta"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"data": meta})
}

// Eliminar una meta
func (mc *MetaController) DeleteMeta(c *gin.Context) {
	id := c.Param("id")
	if err := mc.DB.Delete(&models.Meta{}, id).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Error al eliminar la meta"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Meta eliminada correctamente"})
}

func (mc *MetaController) GetTotales(c *gin.Context) {

	var totalInscritos int64
	var totalColocados int64
	var totalOrientados int64

	// Contar el total de inscritos
	if err := mc.DB.Table("Inscritos").Count(&totalInscritos).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Error al contar los registros de Inscritos"})
		return
	}

	// Contar el total de colocados
	if err := mc.DB.Table("Colocados").Count(&totalColocados).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Error al contar los registros de Colocados"})
		return
	}

	// Contar el total de orientados
	if err := mc.DB.Table("Orientaciones").Count(&totalOrientados).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Error al contar los registros de Orientados"})
		return
	}

	if err := mc.DB.Table("Orientaciones").Count(&totalOrientados).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Error al contar los registros de Orientados"})
		return
	}

	// Respuesta con los totales
	c.JSON(http.StatusOK, gin.H{

		"total_inscritos":  totalInscritos,
		"total_colocados":  totalColocados,
		"total_orientados": totalOrientados,
	})
}

func (mc *MetaController) GetMetasxMes(c *gin.Context) {
	var results RespuestaGrafico
	var resultOrientaciones []MonthlyCount
	var resultColocados []MonthlyCount
	var resultInscritos []MonthlyCount

	err := mc.DB.Table("Orientaciones").
		Select("TO_CHAR(TO_DATE(fecha_primera_orientacion, 'YYYY-MM-DD'), 'YYYY-MM') AS year_month, COUNT(*) AS count").
		Group("year_month").
		Order("year_month").
		Scan(&resultOrientaciones).Error

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	err1 := mc.DB.Table("Colocados").
		Select("TO_CHAR(TO_DATE(fecha_colocacion, 'YYYY-MM-DD'), 'YYYY-MM') AS year_month, COUNT(*) AS count").
		Group("year_month").
		Order("year_month").
		Scan(&resultColocados).Error

	if err1 != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err1.Error()})
		return
	}

	err2 := mc.DB.Table("Inscritos").
		Select("TO_CHAR(TO_DATE(fecha_inscripcion, 'YYYY-MM-DD'), 'YYYY-MM') AS year_month, COUNT(*) AS count").
		Group("year_month").
		Order("year_month").
		Scan(&resultInscritos).Error

	if err2 != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err2.Error()})
		return
	}

	results.Colocaciones = resultColocados
	results.Orientciones = resultOrientaciones
	results.Inscritos = resultInscritos

	c.JSON(http.StatusOK, results)
}

func (mc *MetaController) GetMetasxTrimestre(c *gin.Context) {

	var results []struct {
		YearQuarter string `json:"year_quarter"`
		Count       int    `json:"count"`
	}

	err := mc.DB.Table("Orientaciones").
		Select(`
            CONCAT(EXTRACT(YEAR FROM TO_DATE(fecha_primera_orientacion, 'YYYY-MM-DD')), '-Q', 
                   EXTRACT(QUARTER FROM TO_DATE(fecha_primera_orientacion, 'YYYY-MM-DD'))) AS year_quarter, 
            COUNT(*) AS count`).
		Group("year_quarter").
		Order("year_quarter").
		Scan(&results).Error

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	if len(results) > 0 {
		// Quedarse solo con el último registro
		results = results[len(results)-1:]
	}

	c.JSON(http.StatusOK, results)
}

func (mc *MetaController) GetMetaxMes(c *gin.Context) {

	var results []MonthlyCount
	var result MonthlyCount

	err := mc.DB.Table("Orientaciones").
		Select("TO_CHAR(TO_DATE(fecha_primera_orientacion, 'YYYY-MM-DD'), 'YYYY-MM') AS year_month, COUNT(*) AS count").
		Group("year_month").
		Order("year_month").
		Scan(&results).Error

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	if len(results) > 0 {
		// Quedarse solo con el último registro
		result = results[len(results)-1]
	}

	c.JSON(http.StatusOK, result)
}

func (mc *MetaController) GetMetaxEtnia(c *gin.Context) {
	// Estructura para almacenar los resultados
	type Result struct {
		Etnia string
		Count int
	}

	var results []Result

	// Consulta SQL cruda
	query := `SELECT r.etnia, COUNT(o.id) AS count
	FROM "Orientaciones" o
	INNER JOIN "RUV_Victimas_LITE" r
	ON o.tipo_identificacion = r.tipo_identificacion
	AND o.identificacion = r.identificacion
	GROUP BY r.etnia;`

	// Consulta
	err := mc.DB.Raw(query).Scan(&results).Error

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
	}

	// Convertir resultados en un mapa
	counts := make(map[string]int)
	for _, result := range results {
		counts[result.Etnia] = result.Count
	}

	c.JSON(http.StatusOK, results)
}
