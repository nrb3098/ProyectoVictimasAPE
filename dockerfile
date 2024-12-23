# Build stage
FROM golang:1.23.3 AS builder
WORKDIR /app

# Instalar dependencias del sistema
RUN apk add --no-cache gcc musl-dev

# Copiar el código fuente
COPY . .

# Copiar y descargar dependencias
COPY go.mod go.sum ./
RUN go mod download


# Construir la aplicación
RUN go build -o main ./cmd

# Configurar el puerto
EXPOSE 8084

# Comando de inicio
CMD ["./main"]
