# Build stage
FROM golang:1.23.3 AS builder
WORKDIR /app

# Copiar el código fuente
COPY . .

# Copiar y descargar dependencias
COPY go.mod go.sum ./
RUN go mod download

# Instalar dependencias necesarias para correr la aplicación
RUN apt-get update && apt-get install -y wget ca-certificates && rm -rf /var/lib/apt/lists/* && wget http://ftp.gnu.org/gnu/libc/glibc-2.32.tar.gz && tar -xvf glibc-2.32.tar.gz && cd glibc-2.32 && mkdir build && cd build && ../configure --prefix=/opt/glibc-2.32 && make -j$(nproc) && make install && rm -rf /glibc-2.32.tar.gz /glibc-2.32 && ln -sf /opt/glibc-2.32/lib/ld-2.32.so /lib64/ld-2.32.so && ln -sf /opt/glibc-2.32/lib/libc-2.32.so /lib64/libc-2.32.so

# Construir la aplicación
RUN go build -o main .


# Copiar el binario desde la etapa de construcción
COPY --from=builder /app/main .

# Configurar el puerto
EXPOSE 8084

# Comando de inicio
CMD ["./main"]