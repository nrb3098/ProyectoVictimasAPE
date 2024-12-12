package routes

import (
	"database/sql"
	controllers "proyectoAPE/Internal/Controllers"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func RegisterRoutes(router *gin.Engine, db *gorm.DB, db_ape *sql.DB) {
	metaController := controllers.MetaController{DB: db, DB_ape: db_ape}
	orientacionesController := controllers.OrientacionesController{DB: db, DB_ape: db_ape}
	api := router.Group("/api/v1")
	{
		// Rutas para metas
		api.POST("/metas", metaController.CreateMeta)
		api.GET("/metas", metaController.GetMetas)
		api.GET("/metas/:id", metaController.GetMetaByID)
		api.PUT("/metas/:id", metaController.UpdateMeta)
		api.DELETE("/metas/:id", metaController.DeleteMeta)

		// Ruta para obtener totales
		api.GET("/metas/totalMetas", metaController.GetTotales)
		api.GET("/metas/ejecucionMensual", metaController.GetMetasxMes)
		api.GET("/metas/ejecucionTrimestral", metaController.GetMetasxTrimestre)

		//Ruta para mover los datos desde la APE.
		api.GET("/orientaciones/ejecucionMeta", orientacionesController.MoverDatosApeOrientaciones)
		//Ruta para crear el csv del reporte.
		api.GET("/orientaciones/exportarOrientaciones", orientacionesController.ExportarOrientacionesCSV)
	}
}
