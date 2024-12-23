# Base image para construcción y ejecución
FROM debian:bookworm AS base
WORKDIR /app

# Instalar herramientas necesarias
RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    ca-certificates \
    golang-1.23.3 && \
    rm -rf /var/lib/apt/lists/*

# Etapa de construcción
FROM base AS builder
WORKDIR /app

# Copiar y descargar dependencias
COPY go.mod go.sum ./
RUN go mod download

# Copiar el código fuente
COPY . .

# Compilar el binario
RUN go build -o main .

# Etapa final: ejecución
FROM base AS runner
WORKDIR /app

# Copiar el binario compilado
COPY --from=builder /app/main .

# Exponer el puerto
EXPOSE 8084

# Comando de inicio
CMD ["./main"]
