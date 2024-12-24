# Base image para construcción y ejecución
FROM debian:bookworm AS base
WORKDIR /app

# Instalar herramientas necesarias
RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Descargar e instalar Go
RUN wget https://go.dev/dl/go1.23.3.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.23.3.linux-amd64.tar.gz && \
    rm go1.23.3.linux-amd64.tar.gz

# Agregar Go al PATH
ENV PATH="/usr/local/go/bin:${PATH}"

# Etapa de construcción
FROM base AS builder
WORKDIR /app

# Copiar y descargar dependencias
COPY go.mod go.sum ./
RUN go mod download

# Copiar el código fuente
COPY . .

# Compilar el binario
RUN /usr/local/go/bin/go build -o main .

# Etapa final: ejecución
FROM base AS runner
WORKDIR /app

# Copiar el binario compilado
COPY --from=builder /app/main .

# Exponer el puerto
EXPOSE 8084

# Comando de inicio
CMD ["./main"]
