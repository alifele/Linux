#! /bin/bash
LED_GPIO=4


#The bash funciton

function setLED
{

	echo $1 > "/sys/class/gpio/gpio$LED_GPIO/value"
	
}


if [ $# -ne 1 ]; then

	echo "No command was passed. Usage is: LEDbash command"
	echo "where command is one of:setup, on, off, status and close"
	echo -e "e.g. bashLED setup, followed by bashLED on"
	exit 2	

fi

echo "The LED command that was passed is: $1"

if [ "$1" == "setup" ]; then

	echo "exporting GPIO number $LED_GPIO"
	echo $LED_GPIO > "/sys/class/gpio/export"
	sleep 1 
	echo "out" > "/sys/class/gpio/gpio$LED_GPIO/direction"

elif [ "$1" == "on" ]; then

	echo "Turning the LED on..."
	setLED 1

elif [ "$1" == "off" ]; then

	echo "Turning the LED off ..."
	setLED 0


elif [ "$1" == "status" ]; then
	state = "/sys/class/gpio/gpio$LED_GPIO/value"
	echo "The LED status is : $state"

elif [ "$1" == "close" ]; then

	echo "Closin the GPIO ..."
	echo 4 > "/sys/class/gpio/unexport"

fi










