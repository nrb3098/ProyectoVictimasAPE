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

type Orientacion struct {
	ID                      uint   `gorm:"primaryKey" json:"id"`
	TipoIdentificacion      string `gorm:"size:10;not null" json:"tipo_identificacion"`
	Identificacion          string `gorm:"size:20;not null" json:"identificacion"`
	TPBID                   int    `json:"tpb_id"`
	IDPersona               int    `json:"id_persona"`
	Estado                  int    `json:"estado"`
	Descripcion             string `gorm:"size:255" json:"descripcion"`
	TPBID2                  int    `json:"tpb_id2"`
	TipoPoblacionSofia      string `gorm:"size:100" json:"tipo_poblacion_sofia"`
	Departamento            string `gorm:"size:100" json:"departamento"`
	OFTID                   string `gorm:"size:20" json:"oft_id"`
	HorioID                 string `gorm:"size:20" json:"horio_id"`
	TipoIdentificacion3     string `gorm:"size:10" json:"tipo_identificacion3"`
	Identificacion4         string `gorm:"size:20" json:"identificacion4"`
	Nombres                 string `gorm:"size:100" json:"nombres"`
	PrimerApellido          string `gorm:"size:100" json:"primer_apellido"`
	SegundoApellido         string `gorm:"size:100" json:"segundo_apellido"`
	Genero                  string `gorm:"size:20" json:"genero"`
	PaiID                   int    `json:"pai_id"`
	DPTID                   string `gorm:"size:10" json:"dpt_id"`
	Departamento5           string `gorm:"size:100" json:"departamento5"`
	MPOID                   string `gorm:"size:20" json:"mpo_id"`
	Municipio               string `gorm:"size:100" json:"municipio"`
	FechaPrimeraOrientacion string `gorm:"size:20" json:"fecha_primera_orientacion"`
	FechaNacimiento         string `gorm:"size:20" json:"fecha_nacimiento"`
	MPOIDNacimiento         string `gorm:"size:20" json:"mpo_id_nacimiento"`
	FuncionarioApeOriento   string `gorm:"size:100" json:"funcionario_ape_oriento"`
	RegID                   int    `json:"reg_id"`
	RegionalFunApeOriento   string `gorm:"size:100" json:"regional_fun_ape_oriento"`
	MPOID6                  string `gorm:"size:20" json:"mpo_id6"`
	EsPDET                  string `gorm:"size:10" json:"es_pdet"`
	EsPNIS                  string `gorm:"size:10" json:"es_pnis"`
	CategoriaRuralidad      string `gorm:"size:50" json:"categoria_ruralidad"`
}

// TableName sobrescribe el nombre de la tabla para evitar que GORM agregue una "s"
func (Orientacion) TableName() string {
	return "Orientaciones"
}

type Inscrito struct {
	ID                  uint   `gorm:"primaryKey" json:"id"`
	TipoIdentificacion  string `gorm:"size:10;not null" json:"tipo_identificacion"`
	Identificacion      string `gorm:"size:20;not null" json:"identificacion"`
	TPBID               int    `json:"tpb_id"`
	IDPersona           int    `json:"id_persona"`
	Estado              int    `json:"estado"`
	Descripcion         string `gorm:"size:255" json:"descripcion"`
	TPBID2              int    `json:"tpb_id2"`
	TipoPoblacionSofia  string `gorm:"size:100" json:"tipo_poblacion_sofia"`
	Departamento        string `gorm:"size:100" json:"departamento"`
	OFTID               string `gorm:"size:20" json:"oft_id"`
	TipoIdentificacion3 string `gorm:"size:10" json:"tipo_identificacion3"`
	Identificacion4     string `gorm:"size:20" json:"identificacion4"`
	Nombres             string `gorm:"size:100" json:"nombres"`
	PrimerApellido      string `gorm:"size:100" json:"primer_apellido"`
	SegundoApellido     string `gorm:"size:100" json:"segundo_apellido"`
	Genero              string `gorm:"size:20" json:"genero"`
	PaiID               int    `json:"pai_id"`
	DPTID               string `gorm:"size:10" json:"dpt_id"`
	Departamento5       string `gorm:"size:100" json:"departamento5"`
	MPOID               string `gorm:"size:20" json:"mpo_id"`
	Municipio           string `gorm:"size:100" json:"municipio"`
	FechaInscripcion    string `gorm:"size:20" json:"fecha_inscripcion"`
	FechaNacimiento     string `gorm:"size:20" json:"fecha_nacimiento"`
	MPOIDNacimiento     string `gorm:"size:20" json:"mpo_id_nacimiento"`
	EsPDET              string `gorm:"size:10" json:"es_pdet"`
	EsPNIS              string `gorm:"size:10" json:"es_pnis"`
	CategoriaRuralidad  string `gorm:"size:50" json:"categoria_ruralidad"`
}

// TableName sobrescribe el nombre de la tabla para evitar la pluralización
func (Inscrito) TableName() string {
	return "Inscritos"
}

type Colocado struct {
	ID                  uint   `gorm:"primaryKey" json:"id"`
	TipoIdentificacion  string `gorm:"size:10;not null" json:"tipo_identificacion"`
	Identificacion      string `gorm:"size:20;not null" json:"identificacion"`
	TPBID               int    `json:"tpb_id"`
	IDPersona           int    `json:"id_persona"`
	Estado              int    `json:"estado"`
	Descripcion         string `gorm:"size:255" json:"descripcion"`
	TPBID2              int    `json:"tpb_id2"`
	TipoPoblacionSofia  string `gorm:"size:100" json:"tipo_poblacion_sofia"`
	Departamento        string `gorm:"size:100" json:"departamento"`
	OFTID               string `gorm:"size:20" json:"oft_id"`
	ENVID               string `gorm:"size:20" json:"env_id"`
	TipoIdentificacion3 string `gorm:"size:10" json:"tipo_identificacion3"`
	Identificacion4     string `gorm:"size:20" json:"identificacion4"`
	Nombres             string `gorm:"size:100" json:"nombres"`
	PrimerApellido      string `gorm:"size:100" json:"primer_apellido"`
	SegundoApellido     string `gorm:"size:100" json:"segundo_apellido"`
	Genero              string `gorm:"size:20" json:"genero"`
	PaiID               int    `json:"pai_id"`
	DPTID               string `gorm:"size:10" json:"dpt_id"`
	Departamento5       string `gorm:"size:100" json:"departamento5"`
	MPOID               string `gorm:"size:20" json:"mpo_id"`
	Municipio           string `gorm:"size:100" json:"municipio"`
	Solicitud           string `gorm:"size:255" json:"solicitud"`
	OCUID               string `gorm:"size:20" json:"ocu_id"`
	Ocupacion           string `gorm:"size:100" json:"ocupacion"`
	Denominacion        string `gorm:"size:100" json:"denominacion"`
	EMPID               string `gorm:"size:20" json:"emp_id"`
	Empresa             string `gorm:"size:100" json:"empresa"`
	FechaColocacion     string `gorm:"size:20" json:"fecha_colocacion"`
	EsEgresado          string `gorm:"size:10" json:"es_egresado"`
	FechaNacimiento     string `gorm:"size:20" json:"fecha_nacimiento"`
	MPOIDNacimiento     string `gorm:"size:20" json:"mpo_id_nacimiento"`
	EsPDET              string `gorm:"size:10" json:"es_pdet"`
	EsPNIS              string `gorm:"size:10" json:"es_pnis"`
	CategoriaRuralidad  string `gorm:"size:50" json:"categoria_ruralidad"`
}

// TableName sobrescribe el nombre de la tabla para evitar la pluralización
func (Colocado) TableName() string {
	return "Colocados"
}

type RUVVictimaLite struct {
	ID                 uint           `gorm:"primaryKey" json:"id"`
	TipoIdentificacion string         `gorm:"size:10;not null" json:"tipo_identificacion"`
	Identificacion     string         `gorm:"size:20;not null" json:"identificacion"`
	Caracterizacion    datatypes.JSON `gorm:"type:json;not null" json:"caracterizacion"`
	Formacion          datatypes.JSON `gorm:"type:json;not null" json:"formacion"`
}

// TableName sobrescribe el nombre de la tabla para evitar pluralización
func (RUVVictimaLite) TableName() string {
	return "RUV_Victimas_LITE"
}
