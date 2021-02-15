#!/bin/bash
# script que reproduce un sonido cuando el precio del bitcoin es mayor a 47000U$S
# https://themushroomkingdom.net/media/smw/wav
# dependencias curl + pulseaudio-utils 

#Colores
redColour="\e[0;31m\033[1m"
endColour="\033[0m\e[0m"

LIMITE=47000
WAV=mario_btc.wav

while true;
do
	VALOR_BTC=$(curl -s rate.sx/1btc | cut -d. -f1)
	[ "$VALOR_BTC" -gt "$LIMITE" ] && paplay "$WAV" || echo -e "${redColour}El valor del bitcoin todavia no llego al valor esperado ${endColour}"
	sleep 10
done

