package models

import (
	"time"

	"gorm.io/gorm"
)

type Orientacion struct {
	gorm.Model
	id                         int
	numero_documento           string
	tipo_documento             string
	tipo_orientacion           string
	nombre_orientado           string
	id_funcionario_ape_oriento int
	descripcion                string
	fecha_orientacion          time.Time
	municipio_orientacion      string
	departamento_orientacion   string
}
