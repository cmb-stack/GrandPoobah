# This is an exercise. Monitor Linux server resources. 
#Total CPU usage
#Total memory usage (Free vs Used including percentage)
#Total disk usage (Free vs Used including percentage)
#Top 5 processes by CPU usage
#Top 5 processes by memory usage


#!/bin/bash

# Total CPU usage
echo "Total CPU usage:"
top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}'

# Total Memory usage (Free vs Used including percentage)
echo "Memory Usage:"
free -h | awk 'NR==2{printf "Used: %s\tFree: %s\tTotal: %s\tPercentage: %.2f%\n", $3, $4, $2, ($3/$2)*100}'

# Total Disk usage (Free vs Used including percentage)
echo "Disk Usage:"
df -h | grep '^/dev' | awk '{print $1, "Used:", $3, "Free:", $4, "Total:", $2, "Percentage:", $5}'

# Top 5 Processes by CPU usage
echo "Top 5 Processes by CPU usage:"
ps aux --sort=-%cpu | head -n 6 | tail -n 5

# Top 5 Processes by Memory usage
echo "Top 5 Processes by Memory usage:"
ps aux --sort=-%mem | head -n 6 | tail -n 5
