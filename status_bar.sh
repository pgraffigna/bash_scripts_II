#!/bin/bash

#Colores
redColour="\e[0;31m\033[1m"
endColour="\033[0m\e[0m"

free -h | awk '/^Mem/ {print "\033[33m" "memoria usada/total: " $3 "/" $2 "\033[0m" }' # memoria
echo -e "\n${redColour}Necesitas tener instalado xsensors para usar el siguiente modulo!!! ${endColour}"
sensors | awk '/^temp1:/ {print "\033[33m" "temperatura del cpu: " $2 "\033[0m" }' # cpu temp
echo -e "\n"
ps axc -o cmd:15,%mem,%cpu --sort=-%mem,%cpu | head # top 10 procesos mem

