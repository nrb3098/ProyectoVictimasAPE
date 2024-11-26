package main

import (
	models "proyectoAPE/Internal/Models"
	"proyectoAPE/cmd/API/initializers"
)

func init() {
	initializers.ConnectToDB()
	initializers.LoadEnvVariables()
}

func main() {
	initializers.DB.AutoMigrate(&models.Orientacion{})
}
