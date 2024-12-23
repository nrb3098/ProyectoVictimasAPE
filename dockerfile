# Build stage
FROM golang:1.23.3 AS builder
WORKDIR /app


# Copiar y descargar dependencias
COPY go.mod go.sum ./
RUN go mod download

# Copiar el código fuente
COPY . .

# Construir un binario estático
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

# Final stage
FROM scratch
WORKDIR /app

# Copiar el binario desde la etapa de construcción
COPY --from=builder /app/main .

# Configurar el puerto
EXPOSE 8084

# Comando de inicio
CMD ["./main"]