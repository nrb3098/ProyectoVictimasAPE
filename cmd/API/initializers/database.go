package initializers

import (
	"database/sql"
	"log"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

var DB *gorm.DB
var DB_ape *sql.DB

func ConnectToDB() {
	var err error
	DB, err = gorm.Open(postgres.Open(dbHost), &gorm.Config{})

	if err != nil {
		log.Fatal("No se pudo conectar con base de datos" + err.Error())
	}
}
