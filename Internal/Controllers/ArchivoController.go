package controllers

import (
	"encoding/csv"
	"net/http"
	"os"
	models "proyectoAPE/Internal/Models"
	"time"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

// RegistrarCSV maneja el registro de un nuevo archivo CSV
func RegistrarCSV(c *gin.Context, db *gorm.DB) {
	var registro models.CSVRegistro
	if err := c.ShouldBindJSON(&registro); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Datos inválidos"})
		return
	}

	// Validar tipo de archivo
	tiposValidos := map[string]bool{"orientaciones": true, "inscritos": true, "colocados": true}
	if !tiposValidos[registro.TipoArchivo] {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Tipo de archivo no válido"})
		return
	}

	// Guardar en la base de datos
	if err := db.Create(&registro).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "No se pudo registrar el archivo"})
		return
	}

	c.JSON(http.StatusCreated, registro)
}

// ExportarCSV genera y exporta un archivo CSV
func ExportarCSV(c *gin.Context, db *gorm.DB) {
	tipo := c.Param("tipo") // Ejemplo: /exportar/orientaciones
	tiposValidos := map[string]bool{"orientaciones": true, "inscritos": true, "colocados": true}
	if !tiposValidos[tipo] {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Tipo de archivo no válido"})
		return
	}

	// Recuperar datos a exportar
	var datos []models.CSVRegistro
	if err := db.Where("tipo_archivo = ?", tipo).Find(&datos).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "No se pudieron recuperar los datos"})
		return
	}

	// Crear archivo CSV
	archivoRuta := "./csv/" + tipo + "_" + time.Now().Format("20060102_150405") + ".csv"
	file, err := os.Create(archivoRuta)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "No se pudo crear el archivo"})
		return
	}
	defer file.Close()

	writer := csv.NewWriter(file)
	defer writer.Flush()

	// Escribir encabezados y datos
	writer.Write([]string{"ID", "TipoArchivo", "RutaArchivo", "FechaCreacion"})
	for _, registro := range datos {
		writer.Write([]string{
			string(registro.ID),
			registro.TipoArchivo,
			registro.RutaArchivo,
			registro.FechaCreacion.Format("2006-01-02 15:04:05"),
		})
	}

	// Registrar archivo en la base de datos
	nuevoRegistro := models.CSVRegistro{
		TipoArchivo:   tipo,
		RutaArchivo:   archivoRuta,
		FechaCreacion: time.Now(),
	}
	if err := db.Create(&nuevoRegistro).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "No se pudo registrar el archivo exportado"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"mensaje": "Archivo exportado exitosamente", "ruta": archivoRuta})
}
