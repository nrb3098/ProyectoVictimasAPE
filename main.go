package main

import (
	"proyectoAPE/Internal/routes"
	"proyectoAPE/cmd/API/initializers"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

func init() {
	initializers.LoadEnvVariables()
	initializers.ConnectToDB()
}

func main() {
	// Crear el servidor
	router := gin.Default()

	// Configuración CORS
	corsConfig := cors.DefaultConfig()
	corsConfig.AllowOrigins = []string{"http://localhost:5173"}
	corsConfig.AllowMethods = []string{"GET", "POST"}
	corsConfig.AllowHeaders = []string{"Origin", "Content-Type", "Authorization"}
	corsConfig.ExposeHeaders = []string{"Content-Length"}
	corsConfig.AllowCredentials = true
	corsConfig.MaxAge = 12 * 3600

	router.Use(cors.New(corsConfig))

	// Registrar rutas
	routes.RegisterRoutes(router, initializers.DB)

	// Iniciar el servidor
	router.Run() // listen and serve on 0.0.0.0:5010
}
