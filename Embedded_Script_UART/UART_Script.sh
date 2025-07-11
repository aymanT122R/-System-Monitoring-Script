#!/bin/bash 

#setup 
stty -F /dev/ttyUSB0 9600 cs8 -cstopb -parenb -echo

#promot user 
echo " read (r) or write (w) !! " 
read quest

#send command function 
send (){ 
        echo "AT" > /dev/ttyUSB0
}

#Read responce function  
read (){
        cat /dev/ttyUSB0
}

#test the input 
if [ ${quest} == r ]; then 
	read        
fi
exit 
