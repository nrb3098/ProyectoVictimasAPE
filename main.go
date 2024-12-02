package main

import (
	"proyectoAPE/Internal/routes"
	"proyectoAPE/cmd/API/initializers"

	"github.com/gin-gonic/gin"
)

func init() {
	initializers.LoadEnvVariables()
	initializers.ConnectToDB()
}

func main() {
	// Crear el servidor
	router := gin.Default()
	// Registrar rutas
	routes.RegisterRoutes(router, initializers.DB)

	// Iniciar el servidor
	router.Run() // listen and serve on 0.0.0.0:8080
}
