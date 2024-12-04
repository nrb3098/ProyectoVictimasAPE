package controllers

import (
	"net/http"
	models "proyectoAPE/Internal/Models"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type MetaController struct {
	DB *gorm.DB
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


// Obtener el total de registros por tabla
func (mc *MetaController) GetTotales(c *gin.Context) {
	var totalInscritos int64
	var totalColocados int64
	var totalOrientados int64

	// Contar el total de inscritos
	if err := cc.DB.Table("Inscritos").Count(&totalInscritos).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Error al contar los registros de Inscritos"})
		return
	}

	// Contar el total de colocados
	if err := cc.DB.Table("Colocados").Count(&totalColocados).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Error al contar los registros de Colocados"})
		return
	}

	// Contar el total de orientados
	if err := cc.DB.Table("Orientados").Count(&totalOrientados).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Error al contar los registros de Orientados"})
		return
	}

	// Respuesta con los totales
	c.JSON(http.StatusOK, gin.H{
		"total_inscritos": totalInscritos,
		"total_colocados": totalColocados,
		"total_orientados": totalOrientados,
	})
}
