package initializers

import (
	"log"
	"os"
)

var dbHost string

func LoadEnvVariables() {
	dbHost = os.Getenv("DB_PASS_RAVAPE")
	if dbHost == "" {
		log.Fatal("Environment variable DB_HOST not set")
	}
}
