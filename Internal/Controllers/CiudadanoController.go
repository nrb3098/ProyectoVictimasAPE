package controllers

import (
	"database/sql"
	"net/http"
	models "proyectoAPE/Internal/Models"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type CiudadanoController struct {
	DB     *gorm.DB
	DB_ape *sql.DB
}

func (cc *CiudadanoController) ValidarSiEsVictima(c *gin.Context) {
	var input struct {
		TipoIdentificacion string `json:"tipo_identificacion" binding:"required"`
		Identificacion     string `json:"identificacion" binding:"required"`
	}

	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	var victima models.RUVVictimaLite
	result := cc.DB.Where("tipo_identificacion = ? AND identificacion = ?", input.TipoIdentificacion, input.Identificacion).First(&victima)

	if result.Error != nil {
		if result.Error == gorm.ErrRecordNotFound {
			c.JSON(http.StatusNotFound, gin.H{"message": "Documento no encontrado"})
		} else {
			c.JSON(http.StatusInternalServerError, gin.H{"error": result.Error.Error()})
		}
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Documento válido", "data": victima})
}
