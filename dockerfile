# Build stage
FROM golang:1.23.3 AS builder
WORKDIR /app


# Copiar y descargar dependencias
COPY go.mod go.sum ./
RUN go mod download

# Copiar el código fuente
COPY . .

# Final stage
FROM debian:bookworm-slim
WORKDIR /app

# Instalar dependencias necesarias para correr la aplicación
RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*

# Copiar el binario desde la etapa de construcción
COPY --from=builder /app/main .

# Configurar el puerto
EXPOSE 8084

# Comando de inicio
CMD ["./main"]