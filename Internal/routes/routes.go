package routes

import (
	controllers "proyectoAPE/Internal/Controllers"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func RegisterRoutes(router *gin.Engine, db *gorm.DB) {
	metaController := controllers.MetaController{DB: db}
	orientacionesController := controllers.OrientacionesController{DB: db}
	archivoController := controllers.ArchivoController{DB: db}
	ciudadanoController := controllers.CiudadanoController{DB: db}

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
		api.GET("/metas/ejecucionMensualNotificacion", metaController.GetMetaxMes)
		api.GET("/metas/ejecucionEtnia", metaController.GetMetaxEtnia)

		// endpoints para validar ciudadano
		api.POST("/ciudadano/ValidarVictima", ciudadanoController.ValidarSiEsVictima)

		//Ruta para crear el csv del reporte.
		api.GET("/orientaciones/exportarOrientaciones", orientacionesController.ExportarOrientacionesCSV)
		api.GET("/archivo/exportarInscritos", archivoController.ExportarInscritosCSV)
		api.GET("/archivo/exportarColocados", archivoController.ExportarColocadosCSV)

		//Ruta para mover los datos desde la APE(usa ORACLE, no usar).
		api.GET("/orientaciones/ejecucionMeta", orientacionesController.MoverDatosApeOrientaciones)

	}
}
