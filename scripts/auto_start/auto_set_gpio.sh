#!/bin/bash
sudo modprobe gpio-pcf857x
sudo sh -c 'echo pcf8574 0x20 > /sys/bus/i2c/devices/i2c-15/new_device'
sudo chmod 777 /sys/class/gpio/export
sudo chmod 777 /sys/class/gpio/unexport
echo 144 > /sys/class/gpio/export
echo 145 > /sys/class/gpio/export
echo 146 > /sys/class/gpio/export
echo 147 > /sys/class/gpio/export
echo 148 > /sys/class/gpio/export
echo 149 > /sys/class/gpio/export
echo 150 > /sys/class/gpio/export
echo 151 > /sys/class/gpio/export
sudo chmod 777 /sys/class/gpio/gpio144/direction
sudo chmod 777 /sys/class/gpio/gpio145/direction
sudo chmod 777 /sys/class/gpio/gpio146/direction
sudo chmod 777 /sys/class/gpio/gpio147/direction
sudo chmod 777 /sys/class/gpio/gpio148/direction
sudo chmod 777 /sys/class/gpio/gpio149/direction
sudo chmod 777 /sys/class/gpio/gpio150/direction
sudo chmod 777 /sys/class/gpio/gpio151/direction
sudo chmod 777 /sys/class/gpio/gpio144/value
sudo chmod 777 /sys/class/gpio/gpio145/value
sudo chmod 777 /sys/class/gpio/gpio146/value
sudo chmod 777 /sys/class/gpio/gpio147/value
sudo chmod 777 /sys/class/gpio/gpio148/value
sudo chmod 777 /sys/class/gpio/gpio149/value
sudo chmod 777 /sys/class/gpio/gpio150/value
sudo chmod 777 /sys/class/gpio/gpio151/value
