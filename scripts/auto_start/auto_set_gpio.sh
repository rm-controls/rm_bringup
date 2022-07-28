#!/bin/bash
sudo modprobe gpio-pcf857x
sudo sh -c 'echo pcf8574 0x20 > /sys/bus/i2c/devices/i2c-15/new_device'
sudo chmod 777 /sys/class/gpio/export
sudo chmod 777 /sys/class/gpio/unexport
for i in 656 657 658 659 660 661 662 663
do
echo ${i} > /sys/class/gpio/export
sudo chmod 777 /sys/class/gpio/gpio${i}/direction
sudo chmod 777 /sys/class/gpio/gpio${i}/value
done
