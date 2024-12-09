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
}
func ConnectToDB_ape() {
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
}
