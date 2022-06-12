#!/bin/bash
while true
do
sudo modprobe gpio-pcf857x
sudo sh -c 'echo pcf8574 0x20 > /sys/bus/i2c/devices/i2c-15/new_device'
sudo chmod 777 /sys/class/gpio/export
sudo chmod 777 /sys/class/gpio/unexport
echo 656 > /sys/class/gpio/export
echo 657 > /sys/class/gpio/export
echo 658 > /sys/class/gpio/export
echo 659 > /sys/class/gpio/export
echo 660 > /sys/class/gpio/export
echo 661 > /sys/class/gpio/export
echo 662 > /sys/class/gpio/export
echo 663 > /sys/class/gpio/export
sudo chmod 777 /sys/class/gpio/gpio656/direction
sudo chmod 777 /sys/class/gpio/gpio657/direction
sudo chmod 777 /sys/class/gpio/gpio658/direction
sudo chmod 777 /sys/class/gpio/gpio659/direction
sudo chmod 777 /sys/class/gpio/gpio660/direction
sudo chmod 777 /sys/class/gpio/gpio661/direction
sudo chmod 777 /sys/class/gpio/gpio662/direction
sudo chmod 777 /sys/class/gpio/gpio663/direction
sudo chmod 777 /sys/class/gpio/gpio656/value
sudo chmod 777 /sys/class/gpio/gpio657/value
sudo chmod 777 /sys/class/gpio/gpio658/value
sudo chmod 777 /sys/class/gpio/gpio659/value
sudo chmod 777 /sys/class/gpio/gpio660/value
sudo chmod 777 /sys/class/gpio/gpio661/value
sudo chmod 777 /sys/class/gpio/gpio662/value
sudo chmod 777 /sys/class/gpio/gpio663/value
Adone

