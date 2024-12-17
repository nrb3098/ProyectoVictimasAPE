package controllers

import (
	"database/sql"
	"encoding/csv"
	"fmt"
	"net/http"
	"os"
	"path/filepath"
	models "proyectoAPE/Internal/Models"
	"time"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type ArchivoController struct {
	DB     *gorm.DB
	DB_ape *sql.DB
}

// ExportarInscritosCSV genera un archivo CSV con los datos de Orientacion
func (oc *ArchivoController) ExportarInscritosCSV(c *gin.Context) {
	// Recuperar todas las orientaciones de la base de datos
	var inscritos []models.Inscrito
	if err := oc.DB.Find(&inscritos).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Error al recuperar los datos de orientaciones"})
		return
	}

	// Asegurarse de que la carpeta ./csv/ exista
	directorio := "./csv"
	if err := os.MkdirAll(directorio, os.ModePerm); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "No se pudo crear el directorio para los archivos CSV"})
		return
	}

	// Crear un archivo CSV
	fileName := filepath.Join(directorio, fmt.Sprintf("inscritos%s.csv", time.Now().Format("20060102_150405")))
	file, err := os.Create(fileName)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "No se pudo crear el archivo CSV"})
		return
	}
	defer file.Close()

	writer := csv.NewWriter(file)
	defer writer.Flush()

	// Escribir encabezados
	headers := []string{
		"ID", "TipoIdentificacion", "Identificacion", "TPBID", "IDPersona", "Estado", "Descripcion",
		"TPBID2", "TipoPoblacionSofia", "Departamento", "OFTID", "HorioID", "TipoIdentificacion3",
		"Identificacion4", "Nombres", "PrimerApellido", "SegundoApellido", "Genero", "PaiID",
		"DPTID", "Departamento5", "MPOID", "Municipio", "FechaInscripcion", "FechaNacimiento",
		"MPOIDNacimiento", "EsPDET", "EsPNIS", "CategoriaRuralidad",
	}
	if err := writer.Write(headers); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "No se pudo escribir los encabezados en el archivo CSV"})
		return
	}

	// Escribir datos
	for _, i := range inscritos {
		record := []string{
			fmt.Sprint(i.ID),
			i.TipoIdentificacion,
			i.Identificacion,
			fmt.Sprint(i.TPBID),
			fmt.Sprint(i.IDPersona),
			fmt.Sprint(i.Estado),
			i.Descripcion,
			fmt.Sprint(i.TPBID2),
			i.TipoPoblacionSofia,
			i.Departamento,
			i.OFTID,
			i.TipoIdentificacion3,
			i.Identificacion4,
			i.Nombres,
			i.PrimerApellido,
			i.SegundoApellido,
			i.Genero,
			fmt.Sprint(i.PaiID),
			i.DPTID,
			i.Departamento5,
			i.MPOID.String, // Convertir sql.NullString a string
			i.Municipio,
			i.FechaInscripcion,
			i.FechaNacimiento,
			i.MPOIDNacimiento,
			i.EsPDET.String,
			i.EsPNIS.String,
			i.CategoriaRuralidad.String,
		}
		if err := writer.Write(record); err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "No se pudo escribir un registro en el archivo CSV"})
			return
		}
	}

	var registroArchivo models.CSVRegistro
	registroArchivo.RutaArchivo = fileName
	registroArchivo.TipoArchivo = "Inscritos"
	registroArchivo.FechaCreacion = time.Now()

	if err := oc.DB.Create(&registroArchivo).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Error al crear la meta"})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "Archivo CSV exportado exitosamente",
		"file":    fileName,
	})
}

// ExportarInscritosCSV genera un archivo CSV con los datos de Orientacion
func (oc *ArchivoController) ExportarColocadosCSV(con *gin.Context) {
	// Recuperar todas las orientaciones de la base de datos
	var colocados []models.Colocado
	if err := oc.DB.Find(&colocados).Error; err != nil {
		con.JSON(http.StatusInternalServerError, gin.H{"error": "Error al recuperar los datos de orientaciones"})
		return
	}

	// Asegurarse de que la carpeta ./csv/ exista
	directorio := "./csv"
	if err := os.MkdirAll(directorio, os.ModePerm); err != nil {
		con.JSON(http.StatusInternalServerError, gin.H{"error": "No se pudo crear el directorio para los archivos CSV"})
		return
	}

	// Crear un archivo CSV
	fileName := filepath.Join(directorio, fmt.Sprintf("colocados%s.csv", time.Now().Format("20060102_150405")))
	file, err := os.Create(fileName)
	if err != nil {
		con.JSON(http.StatusInternalServerError, gin.H{"error": "No se pudo crear el archivo CSV"})
		return
	}
	defer file.Close()

	writer := csv.NewWriter(file)
	defer writer.Flush()

	// Escribir encabezados
	headers := []string{
		"ID", "TipoIdentificacion", "Identificacion", "TPBID", "IDPersona", "Estado", "Descripcion",
		"TPBID2", "TipoPoblacionSofia", "Departamento", "OFTID", "HorioID", "TipoIdentificacion3",
		"Identificacion4", "Nombres", "PrimerApellido", "SegundoApellido", "Genero", "PaiID",
		"DPTID", "Departamento5", "MPOID", "Municipio", "Solicitud", "OCUID", "Ocupacion", "Denominacion", "EMPID", "FechaColocacion", "EsEgresado", "FechaNacimiento",
		"MPOIDNacimiento", "EsPDET", "EsPNIS", "CategoriaRuralidad",
	}
	if err := writer.Write(headers); err != nil {
		con.JSON(http.StatusInternalServerError, gin.H{"error": "No se pudo escribir los encabezados en el archivo CSV"})
		return
	}

	// Escribir datos
	for _, c := range colocados {
		record := []string{
			fmt.Sprint(c.ID),
			c.TipoIdentificacion,
			c.Identificacion,
			fmt.Sprint(c.TPBID),
			fmt.Sprint(c.IDPersona),
			fmt.Sprint(c.Estado),
			c.Descripcion,
			fmt.Sprint(c.TPBID2),
			c.TipoPoblacionSofia,
			c.Departamento,
			c.OFTID,
			c.TipoIdentificacion3,
			c.Identificacion4,
			c.Nombres,
			c.PrimerApellido,
			c.SegundoApellido,
			c.Genero,
			fmt.Sprint(c.PaiID),
			c.DPTID,
			c.Departamento5,
			c.MPOID.String, // Convertir sql.NullString a string
			c.Municipio,
			c.Solicitud,
			c.OCUID,
			c.Ocupacion,
			c.Denominacion,
			c.EMPID,
			c.Empresa,
			c.FechaColocacion,
			c.EsEgresado,
			c.FechaNacimiento,
			c.MPOIDNacimiento,
			c.EsPDET.String,
			c.EsPNIS.String,
			c.CategoriaRuralidad.String,
		}
		if err := writer.Write(record); err != nil {
			con.JSON(http.StatusInternalServerError, gin.H{"error": "No se pudo escribir un registro en el archivo CSV"})
			return
		}
	}

	var registroArchivo models.CSVRegistro
	registroArchivo.RutaArchivo = fileName
	registroArchivo.TipoArchivo = "Inscritos"
	registroArchivo.FechaCreacion = time.Now()

	if err := oc.DB.Create(&registroArchivo).Error; err != nil {
		con.JSON(http.StatusInternalServerError, gin.H{"error": "Error al crear la meta"})
		return
	}

	con.JSON(http.StatusOK, gin.H{
		"message": "Archivo CSV exportado exitosamente",
		"file":    fileName,
	})
}
