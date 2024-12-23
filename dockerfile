# Build stage
FROM golang:1.23.3 AS builder
WORKDIR /app


# Copiar el código fuente
COPY . .

# Copiar y descargar dependencias
COPY go.mod go.sum ./
RUN go mod download

# Instalar dependencias necesarias para correr la aplicación
RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*

# Construir la aplicación
RUN go build -o main ./cmd

# Configurar el puerto
EXPOSE 8084

# Comando de inicio
CMD ["./main"]
