package initializers

import (
	"database/sql"
	"log"
	"os"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

var DB *gorm.DB
var DB_ape *sql.DB

func ConnectToDB() {
	var err error
	dsn := os.Getenv("DB_PASS_RAVAPE")
	DB, err = gorm.Open(postgres.Open(dsn), &gorm.Config{})

	if err != nil {
		log.Fatal("No se pudo conectar con base de datos" + dsn)
	}
}
