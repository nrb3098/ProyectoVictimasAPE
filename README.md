# Proyecto Victimas API-APE

Este es un proyecto de API construido en Go, que interactúa con bases de datos Oracle y NoSQL, y utiliza Redis para el caché. La API permite validar documentos de identidad, registrar orientaciones brindadas a víctimas, generar informes, y hacer rastreo de orientaciones a nivel regional y nacional.

## Estructura del Proyecto

La estructura del proyecto está organizada de manera modular, separando las diferentes responsabilidades de la aplicación para facilitar el mantenimiento y la escalabilidad. A continuación se describe cada directorio y archivo:

```
├── cmd/
│   └── api/
│       └── main.go                # Punto de entrada de la API, inicialización de rutas, configuración de servidores.
├── internal/
│   ├── handlers/                  # Controladores de la API (responsables de manejar las solicitudes y respuestas).
│   │   ├── user_handler.go        # Controlador para gestionar la validación de usuarios y creación de registros de orientaciones.
│   │   ├── orientation_handler.go # Controlador para gestionar las orientaciones, consultas y generación de informes.
│   ├── services/                  # Lógica de negocio central de la API (interacción con la base de datos, validaciones).
│   │   ├── user_service.go        # Servicios para la validación de usuarios.
│   │   ├── orientation_service.go # Servicios para manejar las orientaciones y su almacenamiento.
│   ├── models/                    # Modelos de datos, representaciones de las entidades.
│   │   ├── user.go                # Estructura de datos para un usuario (persona).
│   │   ├── orientation.go         # Estructura de datos para una orientación.
│   ├── database/                  # Lógica de acceso a datos (gestión de la base de datos).
│   │   ├── oracle.go              # Conexión e interacción con Oracle.
│   │   ├── nosql.go               # Conexión e interacción con la base de datos NoSQL.
│   ├── cache/                     # Manejo del middleware de caché (Redis).
│   │   └── redis.go               # Conexión e interacción con Redis para caché de consultas frecuentes.
│   ├── auth/                      # Gestión de autenticación y autorización.
│   │   └── jwt.go                 # Generación y validación de tokens JWT.
├── pkg/                           # Librerías o módulos reutilizables en todo el proyecto.
│   ├── utils/                     # Funciones utilitarias (validación de entradas, formateo, etc.).
│   │   └── validators.go          # Validaciones comunes para los datos de entrada.
├── configs/                       # Archivos de configuración.
│   ├── config.go                  # Variables globales de configuración (base de datos, API keys, etc.).
├── scripts/                       # Scripts útiles (migraciones, inicialización de base de datos, etc.).
│   └── migrate.sh                 # Script para migraciones de la base de datos (Oracle y NoSQL).
├── Dockerfile                     # Archivo Docker para contenedor de la API.
├── go.mod                         # Gestión de dependencias de Go.
├── go.sum                         # Resumen de las dependencias.
└── README.md                      # Documentación del proyecto.
```

## Descripción de la Estructura

- **`cmd/`**:
  - Contiene el punto de entrada principal del proyecto. El archivo `main.go` es responsable de iniciar la API y configurar las rutas y servidores.

- **`internal/`**:
  - Este directorio contiene la lógica principal de la aplicación. Está subdividido en varios subdirectorios:
    - **`handlers/`**: Controladores para manejar las solicitudes y respuestas de la API.
    - **`services/`**: Lógica de negocio, como la validación de datos y la manipulación de registros.
    - **`models/`**: Modelos que representan las entidades clave, como usuarios y orientaciones.
    - **`database/`**: Conexión con la base de datos Oracle y NoSQL.
    - **`cache/`**: Manejo del middleware de caché con Redis.
    - **`auth/`**: Funciones relacionadas con la autenticación, como la validación de tokens JWT.

- **`pkg/`**:
  - Contiene utilidades generales y funciones comunes, como validadores de entradas.

- **`configs/`**:
  - Archivos de configuración global, como las credenciales de base de datos y configuraciones de API.

- **`scripts/`**:
  - Scripts de utilidad como migraciones de base de datos o la inicialización de datos.

- **`Dockerfile`**:
  - Define el contenedor Docker para el proyecto, asegurando que sea fácil de desplegar en cualquier entorno.

- **`go.mod` y `go.sum`**:
  - Archivos para gestionar las dependencias de Go.

## Instalación

1. Clona el repositorio:
   ```bash
   git clone https://github.com/nrb3098/ProyectoVictimasAPE.git
   ```

2. Accede al directorio del proyecto:
   ```bash
   cd ProyectoVictimasAPE
   ```

3. Instala las dependencias:
   ```bash
   go mod tidy
   ```

4. Ejecuta la aplicación:
   ```bash
   go run cmd/api/main.go
   ```

## Uso