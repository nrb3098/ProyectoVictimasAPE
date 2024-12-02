package main

import (
	models "proyectoAPE/Internal/Models"
	"proyectoAPE/cmd/API/initializers"
)

func init() {
	initializers.LoadEnvVariables()
	initializers.ConnectToDB()
}

func main() {
	// Migrar las tablas
	initializers.DB.AutoMigrate(
		&models.RUVVictimaLite{},
		&models.Colocado{},
		&models.Inscrito{},
		&models.Orientacion{},
		&models.Municipio{},
		&models.Regional{},
		&models.Meta{},
	)

}
