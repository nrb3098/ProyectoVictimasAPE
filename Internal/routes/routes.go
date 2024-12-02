package routes

import (
	controllers "proyectoAPE/Internal/Controllers"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func RegisterRoutes(router *gin.Engine, db *gorm.DB) {
	metaController := controllers.MetaController{DB: db}

	api := router.Group("/api/v1")
	{
		// Rutas para metas
		api.POST("/metas", metaController.CreateMeta)
		api.GET("/metas", metaController.GetMetas)
		api.GET("/metas/:id", metaController.GetMetaByID)
		api.PUT("/metas/:id", metaController.UpdateMeta)
		api.DELETE("/metas/:id", metaController.DeleteMeta)
	}
}
