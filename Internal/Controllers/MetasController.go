package controllers

import (
	"database/sql"
	"net/http"
	models "proyectoAPE/Internal/Models"

	"github.com/gin-gonic/gin"
	_ "github.com/godror/godror"
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
	var Metas []models.Meta

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

	//traer todas las metas.
	if err := mc.DB.Find(&Metas).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Error al traer las metas"})
		return
	}
	// Respuesta con los totales
	c.JSON(http.StatusOK, gin.H{

		"total_inscritos":  totalInscritos,
		"total_colocados":  totalColocados,
		"total_orientados": totalOrientados,
		"Metas":            Metas,
	})

}

func (mc *MetaController) GetMetasxMes(c *gin.Context) {
	var results []MonthlyCount
	err := mc.DB.Table("Orientaciones").
		Select("TO_CHAR(TO_DATE(fecha_primera_orientacion, 'YYYY-MM-DD'), 'YYYY-MM') AS year_month, COUNT(*) AS count").
		Group("year_month").
		Order("year_month").
		Scan(&results).Error

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

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

	c.JSON(http.StatusOK, results)
}
