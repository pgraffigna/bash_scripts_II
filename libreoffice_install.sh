#!/bin/bash
# script para instalar libreoffice version 7.0.4 + idioma español

#Colores
greenColor="\e[0;32m\033[1m"
redColor="\e[0;31m\033[1m"
yellowColor="\e[0;33m\033[1m"
blueColor="\e[0;34m\033[1m"
endColor="\033[0m\e[0m"

URL=http://download.documentfoundation.org/libreoffice/stable/7.0.4/deb/x86_64/LibreOffice_7.0.4_Linux_x86-64_deb.tar.gz
URL_LANG=http://download.documentfoundation.org/libreoffice/stable/7.0.4/deb/x86_64/LibreOffice_7.0.4_Linux_x86-64_deb_langpack_es.tar.gz
TAR=LibreOffice_7.0.4_Linux_x86-64_deb.tar
TAR_LANG=LibreOffice_7.0.4_Linux_x86-64_deb_langpack_es.tar

trap "rm -rf LibreOffice_7.0.4.?_Linux_x86-64_deb*" EXIT

trap ctrl_c INT
function ctrl_c(){
        echo -e "\n${redColor}Programa Terminado ${endColor}"
        exit 0
}

echo -e "${blueColor}Eliminando versiones anteriores ${endColor}"
sudo apt remove --purge libreoffice* && sudo apt clean && sudo apt autoremove

echo -e "${yellowColor}Descargando libreoffice y descomprimiendo ${endColor}"
wget "$URL" && gunzip *.gz && tar xvf "$TAR" && rm $_ 

echo -e "${yellowColor}Instalando el programa ${endColor}"
sudo dpkg -i LibreOffice_7.0.4.?_Linux_x86-64_deb/DEBS/*.deb

echo -e "${yellowColor}Descargando el paquete español y descomprimiendo ${endColor}"
wget "$URL_LANG" && gunzip *.gz && tar xvf "$TAR_LANG" && rm $_

echo -e "${yellowColor}Instalando el paquete español ${endColor}"
sudo dpkg -i LibreOffice_7.0.4.?_Linux_x86-64_deb_langpack_es/DEBS/*.deb

echo -e "${greenColor}Todos los procesos terminaron correctamente!! ${endColor}"


