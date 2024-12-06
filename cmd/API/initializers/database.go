package initializers

import (
	"database/sql"
	"log"
	"os"

	_ "github.com/godror/godror"
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

	//conección a la BD de oracle
	DB_ape, err := sql.Open("godror", `user="ape_replica" password="123456" connectString="localhost:1521/xe"`)
	if err != nil {
		log.Fatal("No se pudo conectar con base de datos" + err.Error())
	}
	if err = DB_ape.Ping(); err != nil {
		log.Fatal("No se pudo conectar con base de datos" + err.Error())
	}

}
