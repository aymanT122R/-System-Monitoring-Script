#!/bin/sh  

# Setup serial port
stty -F /dev/ttyUSB0 9600 cs8 -cstopb -parenb -echo

# Joint initilizing 
Joint_1=0
Joint_2=0
Joint_3=0
Joint_4=0
Joint_5=0
Joint_6=0
Joint_7=0

# Function to send data
send() {
    echo "Sending Joint Position..."
    echo "Joint_1 : ${Joint_1}" > /dev/ttyUSB0
    echo "Joint_2 : ${Joint_2}" > /dev/ttyUSB0
    echo "Joint_3 : ${Joint_3}" > /dev/ttyUSB0
    echo "Joint_4 : ${Joint_4}" > /dev/ttyUSB0
    echo "Joint_5 : ${Joint_5}" > /dev/ttyUSB0
    echo "Joint_6 : ${Joint_6}" > /dev/ttyUSB0
    echo "Joint_7 : ${Joint_7}" > /dev/ttyUSB0
}

# Function to read data
read_serial() {
    echo "Waiting for response..."
    cat /dev/ttyUSB0
}

# Prompt user
echo "Read (r) or Write (w)?"
read quest

# Handle input
if [ "$quest" = "r" ]; then
    read_serial
elif [ "$quest" = "w" ]; then
    send
else
    echo "Invalid option. Please enter 'r' or 'w'."
fi
 
