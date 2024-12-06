# Imagen base de Go con Alpine
FROM golang:1.23.3-alpine
 
# Instalar dependencias necesarias para Oracle Instant Client y compilación
RUN apk add --no-cache \
    bash \
    libc6-compat \
    libaio \
    gcc \
    musl-dev \
    make \
    gcompat \
    wget \
    unzip
 
# Descargar e instalar Oracle Instant Client
RUN wget https://download.oracle.com/otn_software/linux/instantclient/2116000/instantclient-basic-linux.x64-21.16.0.0.0dbru.zip -O /tmp/instantclient.zip && \
    mkdir -p /opt/oracle && \
    unzip /tmp/instantclient.zip -d /opt/oracle && \
    rm /tmp/instantclient.zip
 
# Configurar variables de entorno para Oracle Instant Client
ENV LD_LIBRARY_PATH=/opt/oracle/instantclient_21_16:$LD_LIBRARY_PATH
ENV ORACLE_HOME=/opt/oracle/instantclient_21_16
 
 
# Crear directorio de trabajo
WORKDIR /app
 
# Copiar el código fuente al contenedor
COPY . .
 
