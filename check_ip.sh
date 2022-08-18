#!/bin/bash
. ./parametros.lib
cd $LOCAL_BOT

currentIp=$(curl -s ifconfig.me)
file=lastIp

if [ -f "$file" ]; then

	lastIp=$(cat $file)
	
	if [ $currentIp = $lastIp ]; then
		echo "Mesmo"
	else
		echo "Mudou"
		bash push_notification.sh "NOVO IP ($DEVICE_NAME)" "$currentIp"
		icone="--icon=${LOCAL_BOT}/icons/ip.png"
		notify-send -t 10000 $icone "NOVO IP ($DEVICE_NAME)" "$currentIp"
		echo $currentIp > $file
	fi
	
else 
	echo "File lastIp not exists."
	echo "Run script again."
	echo $currentIp > $file
	
fi


