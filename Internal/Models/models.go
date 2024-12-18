package models

import (
	"time"

	"gorm.io/datatypes"
)

// Regional Table
type Regional struct {
	ID             uint   `gorm:"primaryKey" json:"id"`
	RegionalNombre string `gorm:"size:100;not null" json:"reg_nombre"`
}

// TableName sobrescribe el nombre de la tabla para evitar que GORM agregue una "s"
func (Regional) TableName() string {
	return "Regionales"
}

// Municipios Table
type Municipio struct {
	ID              uint   `gorm:"primaryKey" json:"id"`
	MunicipioNombre string `gorm:"size:100;not null" json:"mpo_nombre"`
}

// Metas Table
type Meta struct {
	ID          uint      `gorm:"primaryKey" json:"id"`
	NombreMeta  string    `gorm:"size:100;not null" json:"nombre_meta"`
	CifraMeta   int       `gorm:"not null" json:"cifra_meta"`
	RegionalID  uint      `gorm:"not null" json:"regional_id"`
	FechaInicio time.Time `gorm:"not null" json:"fecha_inicio"`
	FechaCorte  time.Time `gorm:"not null" json:"fecha_corte"`
	Regional    Regional  `gorm:"foreignKey:RegionalID" json:"regional"`
}

type RUVVictimaLite struct {
	ID                 uint           `gorm:"primaryKey" json:"id"`
	TipoIdentificacion string         `gorm:"size:10;not null" json:"tipo_identificacion"`
	Identificacion     string         `gorm:"size:20;not null" json:"identificacion"`
	Caracterizacion    datatypes.JSON `gorm:"type:json;not null" json:"caracterizacion"`
	Etnia              string         `gorm:"size:60;not null" json:"etnia"`
}

// TableName sobrescribe el nombre de la tabla para evitar pluralización
func (RUVVictimaLite) TableName() string {
	return "RUV_Victimas_LITE"
}

// CSVRegistro representa la estructura de la tabla csv_registros
type CSVRegistro struct {
	ID            uint      `gorm:"primaryKey" json:"id"`
	TipoArchivo   string    `gorm:"size:50;not null" json:"tipo_archivo"` // orientaciones, inscritos, colocados
	RutaArchivo   string    `gorm:"not null" json:"ruta_archivo"`         // Ruta relativa del archivo
	FechaCreacion time.Time `gorm:"autoCreateTime" json:"fecha_creacion"`
}

// TableName sobrescribe el nombre de la tabla para evitar pluralización
func (CSVRegistro) TableName() string {
	return "csv_registros"
}
