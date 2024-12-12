package models

import "database/sql"

type Colocado struct {
	ID                  uint           `gorm:"primaryKey" json:"id"`
	TipoIdentificacion  string         `gorm:"size:10;not null" json:"tipo_identificacion"`
	Identificacion      string         `gorm:"size:20;not null" json:"identificacion"`
	TPBID               int            `json:"tpb_id"`
	IDPersona           int            `json:"id_persona"`
	Estado              int            `json:"estado"`
	Descripcion         string         `gorm:"size:255" json:"descripcion"`
	TPBID2              int            `json:"tpb_id2"`
	TipoPoblacionSofia  string         `gorm:"size:100" json:"tipo_poblacion_sofia"`
	Departamento        string         `gorm:"size:100" json:"departamento"`
	OFTID               string         `gorm:"size:20" json:"oft_id"`
	ENVID               string         `gorm:"size:20" json:"env_id"`
	TipoIdentificacion3 string         `gorm:"size:10" json:"tipo_identificacion3"`
	Identificacion4     string         `gorm:"size:20" json:"identificacion4"`
	Nombres             string         `gorm:"size:100" json:"nombres"`
	PrimerApellido      string         `gorm:"size:100" json:"primer_apellido"`
	SegundoApellido     string         `gorm:"size:100" json:"segundo_apellido"`
	Genero              string         `gorm:"size:20" json:"genero"`
	PaiID               int            `json:"pai_id"`
	DPTID               string         `gorm:"size:10" json:"dpt_id"`
	Departamento5       string         `gorm:"size:100" json:"departamento5"`
	MPOID               sql.NullString `gorm:"size:20" json:"mpo_id"`
	Municipio           string         `gorm:"size:100" json:"municipio"`
	Solicitud           string         `gorm:"size:255" json:"solicitud"`
	OCUID               string         `gorm:"size:20" json:"ocu_id"`
	Ocupacion           string         `gorm:"size:100" json:"ocupacion"`
	Denominacion        string         `gorm:"size:100" json:"denominacion"`
	EMPID               string         `gorm:"size:20" json:"emp_id"`
	Empresa             string         `gorm:"size:100" json:"empresa"`
	FechaColocacion     string         `gorm:"size:30" json:"fecha_colocacion"`
	EsEgresado          string         `gorm:"size:10" json:"es_egresado"`
	FechaNacimiento     string         `gorm:"size:30" json:"fecha_nacimiento"`
	MPOIDNacimiento     string         `gorm:"size:20" json:"mpo_id_nacimiento"`
	EsPDET              sql.NullString `gorm:"size:10" json:"es_pdet"`
	EsPNIS              sql.NullString `gorm:"size:10" json:"es_pnis"`
	CategoriaRuralidad  sql.NullString `gorm:"size:50" json:"categoria_ruralidad"`
}

// TableName sobrescribe el nombre de la tabla para evitar la pluralización
func (Colocado) TableName() string {
	return "Colocados"
}
