#!/bin/bash 
#script1.sh

while true; do
       	
	echo "________________System Monotoring Script________________"
	echo "Current time: $(date '+%Y-%m-%d %H:%M:%S')"
	echo "System uptime: $(uptime)"
	free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n" , $3,$2,$3*100/$2}'   
	echo "Free memory: $(free -m | awk 'NR==2 {print $6}')"
	df -h | awk '$NF=="/"{printf "Disk Usage: %d/%d GB (%s) \n" ,$3,$2,$5}'
	echo "Free disk space: $(df -h / | awk 'NR==2 {print $4}')"
	top -bn1 | grep load | awk '{printf "CPU Load %.2f\n", $(NF-2)}'
	echo "Load average: $(cat /proc/loadavg | awk '{print $1,$2,$3}')"
	echo "___________Press Ctr+c to exit or Wait 7 seconds________\n\n"
	sleep 7
done

exit 
