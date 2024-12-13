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
		// CRUD para metas
		api.POST("/metas", metaController.CreateMeta)
		api.GET("/metas/:id", metaController.GetMetaByID)
		api.PUT("/metas/:id", metaController.UpdateMeta)
		api.DELETE("/metas/:id", metaController.DeleteMeta)

		// endpoints para dashboard
		api.GET("/metas/ejecuciónAnual", metaController.GetTotales)              //Da el contador de los que van a la fecha
		api.GET("/metas/ejecucionMensual", metaController.GetMetasxMes)          //Para notificaciones (solo orientaciones)
		api.GET("/metas/ejecucionTrimestral", metaController.GetMetasxTrimestre) //Para notificaciones (solo orientaciones)
		api.GET("/metas", metaController.GetMetas)                               //Entrega todas las metas para hacer el comparativo vs anual

		//Ruta para mover los datos desde la APE.
		api.GET("/orientaciones/ejecucionMeta", orientacionesController.MoverDatosApeOrientaciones)
		//Ruta para crear el csv del reporte.
		api.GET("/orientaciones/exportarOrientaciones", orientacionesController.ExportarOrientacionesCSV)
	}
}
