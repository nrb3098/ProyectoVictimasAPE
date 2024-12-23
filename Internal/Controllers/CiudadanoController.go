package controllers

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"net/http"
	models "proyectoAPE/Internal/Models"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type CiudadanoController struct {
	DB     *gorm.DB
	DB_ape *sql.DB
}

func (cc *CiudadanoController) ValidarSiEsVictima(c *gin.Context) {
	var input struct {
		TipoIdentificacion string `json:"tipo_identificacion" binding:"required"`
		Identificacion     string `json:"identificacion" binding:"required"`
	}
	var resultados struct {
		Victima   models.RUVVictimaLite
		Nombres   string
		Apellidos string
	}

	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	var victima models.RUVVictimaLite

	resultadoVictima := cc.DB.Where("tipo_identificacion = ? AND identificacion = ?", input.TipoIdentificacion, input.Identificacion).First(&victima)

	if resultadoVictima.Error != nil {
		if resultadoVictima.Error == gorm.ErrRecordNotFound {
			c.JSON(http.StatusNotFound, gin.H{"message": "Documento no encontrado"})
		} else {
			c.JSON(http.StatusInternalServerError, gin.H{"error": resultadoVictima.Error.Error()})
		}
		return
	}

	resultados.Victima = victima

	// Buscar en la tabla Orientados
	var orientado models.Orientacion
	resultadoOrientado := cc.DB.Where("tipo_identificacion = ? AND identificacion = ?", input.TipoIdentificacion, input.Identificacion).First(&orientado)
	if resultadoOrientado.Error == nil {
		resultados.Nombres = orientado.Nombres
		resultados.Apellidos = fmt.Sprintf("%s %s", orientado.PrimerApellido, orientado.SegundoApellido)
		c.JSON(http.StatusOK, gin.H{"message": "Documento válido", "data": resultados})
		return
	}

	// Buscar en la tabla Inscritos
	var inscrito models.Inscrito
	resultadoInscrito := cc.DB.Where("tipo_identificacion = ? AND identificacion = ?", input.TipoIdentificacion, input.Identificacion).First(&inscrito)
	if resultadoInscrito.Error == nil {
		resultados.Nombres = inscrito.Nombres
		resultados.Apellidos = fmt.Sprintf("%s %s", inscrito.PrimerApellido, inscrito.SegundoApellido)
		c.JSON(http.StatusOK, gin.H{"message": "Documento válido", "data": resultados})
		return
	}

	// Buscar en la tabla Colocados
	var colocado models.Colocado
	resultadoColocado := cc.DB.Where("tipo_identificacion = ? AND identificacion = ?", input.TipoIdentificacion, input.Identificacion).First(&colocado)
	if resultadoColocado.Error == nil {
		resultados.Nombres = colocado.Nombres
		resultados.Apellidos = fmt.Sprintf("%s %s", colocado.PrimerApellido, colocado.SegundoApellido)
		c.JSON(http.StatusOK, gin.H{"message": "Documento válido", "data": resultados})
		return
	}

	// Si no se encuentra en ninguna tabla, consultar a la API externa
	nombres, apellidos, err := consultarAPIExterna(input.TipoIdentificacion, input.Identificacion)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "No se pudieron obtener los datos desde la API externa"})
		return
	}

	resultados.Nombres = nombres
	resultados.Apellidos = apellidos

	c.JSON(http.StatusOK, gin.H{"message": "Documento válido y datos obtenidos de la API externa", "data": resultados})
}

// consultarAPIExterna realiza la consulta a la API externa
func consultarAPIExterna(tipoIdentificacion, identificacion string) (string, string, error) {
	// Implementa la lógica para hacer una solicitud HTTP a la API externa
	// Aquí se usa un ejemplo básico con el paquete net/http
	client := &http.Client{}
	url := fmt.Sprintf("https://api-externa.com/victimas?tipo_identificacion=%s&identificacion=%s", tipoIdentificacion, identificacion)

	req, err := http.NewRequest("GET", url, nil)
	if err != nil {
		return "", "", err
	}

	resp, err := client.Do(req)
	if err != nil {
		return "", "", err
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		return "", "", fmt.Errorf("API externa retornó el estado: %s", resp.Status)
	}

	var apiResponse struct {
		Nombres   string `json:"nombres"`
		Apellidos string `json:"apellidos"`
	}

	if err := json.NewDecoder(resp.Body).Decode(&apiResponse); err != nil {
		return "", "", err
	}

	return apiResponse.Nombres, apiResponse.Apellidos, nil
}
