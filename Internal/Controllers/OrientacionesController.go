package controllers

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"
	models "proyectoAPE/Internal/Models"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type OrientacionesController struct {
	DB     *gorm.DB
	DB_ape *sql.DB
}

// Obtener el total de registros por tabla
func (oc *OrientacionesController) MoverDatosApeOrientaciones(c *gin.Context) {

	// Consulta SQL
	query := "SELECT ruv.*, TPR.*, orientados.DPT_ID || ' ' || orientados.DEPARTAMENTO AS DEPARTAMENTO, orientados.*, (TRIM(OFE.OFT_NOMBRES) || ' ' || TRIM(OFE.OFT_PRIMER_APELLIDO) || ' ' || TRIM(OFE.OFT_SEGUNDO_APELLIDO)) AS FUNCIONARIO_APE_Orientó, REG.REG_ID AS REG_ID, REG.REG_NOMBRE AS Regional_fun_APE_Orientó, REG.MPO_ID AS MPO_ID, mpoc.ES_PDET AS ES_PDET, mpoc.ES_PNIS AS ES_PNIS, mpoc.RURALIDAD AS Categoria_Ruralidad FROM AC_ORIENTADOS orientados JOIN RUV ruv ON (orientados.IDENTIFICACION = ruv.IDENTIFICACION AND orientados.TIPO_IDENTIFICACION = ruv.TIPO_IDENTIFICACION) JOIN TIPO_POBLACION_SOFIA_RUV TPR ON (ruv.TPB_ID = TPR.TPB_ID) LEFT JOIN HIS_ORIENTACION_OFT hoo ON orientados.HORIO_ID = hoo.HORIO_ID LEFT JOIN FUNCIONARIO FUN ON hoo.FUN_ID = FUN.FUN_ID LEFT JOIN OFERTA OFE ON FUN.OFT_ID = OFE.OFT_ID LEFT JOIN CENTRO_SPE CSPE ON FUN.CSPE_ID = CSPE.CSPE_ID LEFT JOIN REGIONAL REG ON CSPE.REG_ID = REG.REG_ID LEFT JOIN MUNICIPIOS_CARACTERIZADOS mpoc ON (OFE.MPO_ID = mpoc.MPO_ID) WHERE TRUNC(ORIENTADOS.FECHA_PRIMERA_ORIENTACION)        BETWEEN TO_DATE('01/01/2024', 'DD/MM/YYYY')        AND TO_DATE('30/09/2024', 'DD/MM/YYYY') ORDER BY orientados.IDENTIFICACION"

	// Ejecutar la consulta
	rows, err := oc.DB_ape.Query(query)
	if err != nil {
		log.Printf("Error ejecutando la consulta: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Error ejecutando la consulta a la base de datos."})
		return
	}

	defer rows.Close()
	var results []models.Orientacion
	for rows.Next() {
		var row models.Orientacion
		err := rows.Scan(
			&row.TipoIdentificacion,
			&row.Identificacion,
			&row.TPBID,
			&row.IDPersona,
			&row.Estado,
			&row.Descripcion,
			&row.TPBID2,
			&row.TipoPoblacionSofia,
			&row.Departamento,
			&row.OFTID,
			&row.HorioID,
			&row.TipoIdentificacion3,
			&row.Identificacion4,
			&row.Nombres,
			&row.PrimerApellido,
			&row.SegundoApellido,
			&row.Genero,
			&row.PaiID,
			&row.DPTID,
			&row.Departamento5,
			&row.MPOID,
			&row.Municipio,
			&row.FechaPrimeraOrientacion,
			&row.FechaNacimiento,
			&row.MPOIDNacimiento,
			&row.FuncionarioApeOriento,
			&row.RegID,
			&row.RegionalFunApeOriento,
			&row.MPOID6,
			&row.EsPDET,
			&row.EsPNIS,
			&row.CategoriaRuralidad,
		)

		if !row.MPOID.Valid {
			row.MPOID.String = "-"
		}
		if !row.MPOID6.Valid {
			row.MPOID.String = "-"
		}
		if !row.EsPDET.Valid {
			row.MPOID.String = "-"
		}
		if !row.EsPNIS.Valid {
			row.MPOID.String = "-"
		}

		if err != nil {
			log.Fatalf("ERROR - error trayendo datos: %v", err)
			continue
		}
		var orientacionAux models.Orientacion
		oc.DB.Where("identificacion = ?", &row.Identificacion).First(&orientacionAux)

		fmt.Print(results)
		if orientacionAux.ID == 0 {
			if err := oc.DB.Create(&row).Error; err != nil {
				log.Fatalf("error añadiendo orientación")
			}
		} else {
			row.ID = orientacionAux.ID
			oc.DB.Save(&row)
		}

		results = append(results, row)
	}

	// Verificar errores de iteración
	if err = rows.Err(); err != nil {
		log.Fatalf("Error iterating rows: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Error iterating rows: " + err.Error()})
		return
	}

	// Enviar los resultados
	c.JSON(http.StatusOK, gin.H{"Results": results})
}
