package main

import (
	"database/sql"
	"log"
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

	//conexión BD ape
	dsn := `user="ape_replica" password="123456" connectString="0.0.0.0:1521/xe"`
	DB_ape, err := sql.Open("godror", dsn)
	if err != nil {
		log.Fatalf("Error al conectar a la base de datos: %v", err)
	}
	defer DB_ape.Close()

	if err = DB_ape.Ping(); err != nil {
		log.Fatalf("No se pudo conectar con base de datos: %v", err)
	}
	log.Println("Conexión a la base de datos exitosa")

	// Configuración CORS
	corsConfig := cors.DefaultConfig()
	corsConfig.AllowOrigins = []string{"http://localhost:5173"}
	corsConfig.AllowMethods = []string{"GET", "POST"}
	corsConfig.AllowHeaders = []string{"Origin", "Content-Type", "Authorization"}
	corsConfig.ExposeHeaders = []string{"Content-Length"}
	corsConfig.AllowCredentials = true
	corsConfig.MaxAge = 12 * 3600

	router.Use(cors.New(corsConfig))

	if DB_ape == nil {
		log.Fatal("NULL")
	}

	// Registrar rutas
	routes.RegisterRoutes(router, initializers.DB, DB_ape)

	// Iniciar el servidor
	router.Run() // listen and serve on 0.0.0.0:5010
}
