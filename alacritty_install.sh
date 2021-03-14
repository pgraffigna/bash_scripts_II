#!/bin/bash
#script para instalar el emulador de terminal ALACRITTY

#Colores
greenColor="\e[0;32m\033[1m"
redColor="\e[0;31m\033[1m"
yellowColor="\e[0;33m\033[1m"
blueColor="\e[0;34m\033[1m"
purpleColor="\e[0;35m\033[1m"
endColor="\033[0m\e[0m"

trap ctrl_c INT
function ctrl_c(){
        echo -e "\n${redColor}Programa Terminado ${endColor}"
        exit 0
}

echo -e "${yellowColor}Instalando dependencias ${endColor}"
sudo apt update && sudo apt install -y curl cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3

echo -e "${yellowColor}Instalando Rust ${endColor}"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh && source $HOME/.cargo/env

echo -e "${yellowColor}Instalando cargo + alacritty ${endColor}"
sudo apt install -y cargo && cargo install alacritty

echo -e "${yellowColor}Descargando los archivos de alacritty ${endColor}"
git clone https://github.com/alacritty/alacritty.git && cd alacritty

echo -e "${yellowColor}Creando accesos directos a la aplicacion ${endColor}"
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg && sudo desktop-file-install extra/linux/Alacritty.desktop && sudo update-desktop-database

echo -e "${yellowColor}Configurando complementos para bash ${endColor}"
echo "source $(pwd)/extra/completions/alacritty.bash" >> ~/.bashrc

echo -e "${greenColor}Todos los procesos terminaron correctamente!!..reinicia la sesion para que hagan efecto los cambios${endColor}"

