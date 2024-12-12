package controllers

import (
	"database/sql"
	"encoding/csv"
	"fmt"
	"log"
	"net/http"
	"os"
	models "proyectoAPE/Internal/Models"
	"time"

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

// Obtener el total de registros por tabla
func (oc *OrientacionesController) MoverDatosApeInscritos(c *gin.Context) {

	// Consulta SQL
	query := "select ruv.*, TPR.*, inscritos.DPT_ID || ' '  || inscritos.DEPARTAMENTO DEPARTAMENTO, inscritos.*, mpoc.ES_PDET ES_PDET, mpoc.ES_PNIS ES_PNIS, mpoc.RURALIDAD categoría_ruralidad from AC_INSCRITOS inscritos join RUV ruv on (inscritos.IDENTIFICACION = ruv.IDENTIFICACION and inscritos.TIPO_IDENTIFICACION = ruv.TIPO_IDENTIFICACION) join TIPO_POBLACION_SOFIA_RUV TPR on (ruv.TPB_ID = TPR.TPB_ID) left JOIN MUNICIPIOS_CARACTERIZADOS mpoc ON (inscritos.MPO_ID = mpoc.MPO_ID) where trunc(inscritos.FECHA_INSCRIPCION) between to_date('01/01/2024','dd/mm/yyyy') and to_date('30/09/2024','dd/mm/yyyy') -- Acumulado order by inscritos.identificacion"

	// Ejecutar la consulta
	rows, err := oc.DB_ape.Query(query)
	if err != nil {
		log.Printf("Error ejecutando la consulta: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Error ejecutando la consulta a la base de datos."})
		return
	}

	defer rows.Close()
	var results []models.Inscrito
	for rows.Next() {
		var row models.Inscrito
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
			&row.FechaInscripcion,
			&row.FechaNacimiento,
			&row.MPOIDNacimiento,
			&row.EsPDET,
			&row.EsPNIS,
			&row.CategoriaRuralidad,
		)

		if !row.MPOID.Valid {
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
		var inscritoAux models.Inscrito
		oc.DB.Where("identificacion = ?", &row.Identificacion).First(&inscritoAux)

		fmt.Print(results)
		if inscritoAux.ID == 0 {
			if err := oc.DB.Create(&row).Error; err != nil {
				log.Fatalf("error añadiendo orientación")
			}
		} else {
			row.ID = inscritoAux.ID
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

// Obtener el total de registros por tabla
func (oc *OrientacionesController) MoverDatosApeColocados(c *gin.Context) {

	// Consulta SQL
	query := "select ruv.*, TPR.*, colocaciones.DPT_ID || ' '  || colocaciones.DEPARTAMENTO DEPARTAMENTO, colocaciones.*, mpoc.ES_PDET ES_PDET, mpoc.ES_PNIS ES_PNIS, mpoc.RURALIDAD categoría_ruralidad from AC_COLOCACIONES colocaciones join RUV ruv on (colocaciones.IDENTIFICACION = ruv.IDENTIFICACION and colocaciones.TIPO_IDENTIFICACION = ruv.TIPO_IDENTIFICACION) join TIPO_POBLACION_SOFIA_RUV TPR on (ruv.TPB_ID = TPR.TPB_ID) left JOIN MUNICIPIOS_CARACTERIZADOS mpoc ON (colocaciones.MPO_ID = mpoc.MPO_ID) where trunc(colocaciones.FECHA_COLOCACION) between to_date('01/01/2024','dd/mm/yyyy') and to_date('30/09/2024','dd/mm/yyyy') order by colocaciones.identificacion"

	// Ejecutar la consulta
	rows, err := oc.DB_ape.Query(query)
	if err != nil {
		log.Printf("Error ejecutando la consulta: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Error ejecutando la consulta a la base de datos."})
		return
	}

	defer rows.Close()
	var results []models.Colocado
	for rows.Next() {
		var row models.Colocado
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
			&row.ENVID,
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
			&row.Solicitud,
			&row.OCUID,
			&row.Ocupacion,
			&row.Denominacion,
			&row.EMPID,
			&row.Empresa,
			&row.FechaColocacion,
			&row.EsEgresado,
			&row.FechaNacimiento,
			&row.MPOIDNacimiento,
			&row.EsPDET,
			&row.EsPNIS,
			&row.CategoriaRuralidad,
		)

		if !row.MPOID.Valid {
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
		var colocadoAux models.Colocado
		oc.DB.Where("identificacion = ?", &row.Identificacion).First(&colocadoAux)

		fmt.Print(results)
		if colocadoAux.ID == 0 {
			if err := oc.DB.Create(&row).Error; err != nil {
				log.Fatalf("error añadiendo colocación")
			}
		} else {
			row.ID = colocadoAux.ID
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

// ExportarOrientacionesCSV genera un archivo CSV con los datos de Orientacion
func (oc *OrientacionesController) ExportarOrientacionesCSV(c *gin.Context) {
	// Recuperar todas las orientaciones de la base de datos
	var orientaciones []models.Orientacion
	if err := oc.DB.Find(&orientaciones).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Error al recuperar los datos de orientaciones"})
		return
	}

	// Crear un archivo CSV
	fileName := fmt.Sprintf("./csv/orientaciones_%s.csv", time.Now().Format("20060102_150405"))
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
		"DPTID", "Departamento5", "MPOID", "Municipio", "FechaPrimeraOrientacion", "FechaNacimiento",
		"MPOIDNacimiento", "FuncionarioApeOriento", "RegID", "RegionalFunApeOriento", "MPOID6",
		"EsPDET", "EsPNIS", "CategoriaRuralidad",
	}
	if err := writer.Write(headers); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "No se pudo escribir los encabezados en el archivo CSV"})
		return
	}

	// Escribir datos
	for _, o := range orientaciones {
		record := []string{
			fmt.Sprint(o.ID),
			o.TipoIdentificacion,
			o.Identificacion,
			fmt.Sprint(o.TPBID),
			fmt.Sprint(o.IDPersona),
			fmt.Sprint(o.Estado),
			o.Descripcion,
			fmt.Sprint(o.TPBID2),
			o.TipoPoblacionSofia,
			o.Departamento,
			o.OFTID,
			o.HorioID,
			o.TipoIdentificacion3,
			o.Identificacion4,
			o.Nombres,
			o.PrimerApellido,
			o.SegundoApellido,
			o.Genero,
			fmt.Sprint(o.PaiID),
			o.DPTID,
			o.Departamento5,
			o.MPOID.String, // Convertir sql.NullString a string
			o.Municipio,
			o.FechaPrimeraOrientacion,
			o.FechaNacimiento,
			o.MPOIDNacimiento,
			o.FuncionarioApeOriento,
			fmt.Sprint(o.RegID.Int64), // Convertir sql.NullInt64 a string
			o.RegionalFunApeOriento,
			o.MPOID6.String,
			o.EsPDET.String,
			o.EsPNIS.String,
			o.CategoriaRuralidad,
		}
		if err := writer.Write(record); err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "No se pudo escribir un registro en el archivo CSV"})
			return
		}
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "Archivo CSV exportado exitosamente",
		"file":    fileName,
	})
}
