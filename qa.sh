#!/bin/bash

FLASH_DELAY=0.25

python  /home/pi/sis_recovery/scripts/rgbw_test.py &

# Setup the Pins as GPIO
echo 2 > /sys/class/gpio/export
echo 3 > /sys/class/gpio/export
echo 4  > /sys/class/gpio/export

# Set the pin directions
echo in > /sys/class/gpio/gpio2/direction
echo out > /sys/class/gpio/gpio3/direction
echo out > /sys/class/gpio/gpio4/direction

# Preset the LEDs to off
echo 1 > /sys/class/gpio/gpio3/value
echo 1 > /sys/class/gpio/gpio4/value

while :
do
	#Both LEDS off
        echo 1 > /sys/class/gpio/gpio3/value
	echo 1 > /sys/class/gpio/gpio4/value
        sleep $FLASH_DELAY

	#If reset is pressed, green on, else red on
	if [ `cat /sys/class/gpio/gpio2/value` -eq 0 ]
        then
                echo 0 > /sys/class/gpio/gpio4/value
	else
		echo 0 > /sys/class/gpio/gpio3/value
        fi
        sleep $FLASH_DELAY

done

