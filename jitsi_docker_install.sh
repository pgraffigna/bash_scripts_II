#!/bin/bash
# script para instalar jitsi via docker

URL="https://github.com/jitsi/docker-jitsi-meet/archive/refs/tags/stable-5963.tar.gz"
TAR="stable-5963.tar.gz"

trap rm "$TAR"
# chequear que esta instalado docker + docker-compose sino instalarlo

echo -e "Descargando el instalador"
wget -q "$URL" \
	&& tar -cxvf "$TAR" \
    && cd FOLDER

echo -e "Creando archivo de configuración para jitsi"
cp env.example .env

echo -e "Generando los passwords para jitsi"
./gen-passwords.sh

echo -e "Creando las carpetas necesarias para jitsi"
mkdir -p ~/.jitsi-meet-cfg/{web/letsencrypt,transcripts,prosody/config,prosody/prosody-plugins-custom,jicofo,jvb,jigasi,jibri}

echo -e "Iniciando el contenedor"
docker-compose up -d

