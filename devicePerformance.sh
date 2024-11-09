echo "Device Performance"
echo "-----------------"

echo "CPU Usage"
wmic cpu get loadpercentage | awk '/[0-9]+/ {print $1 "%"}'
echo "-----------------"

echo "Disk Space"
df -h --total
echo "-----------------"


echo "Memory Usage"
awk '/MemFree/ { printf "Available memory: %.3f \n", $2/1024/1024 }' /proc/meminfo
echo "-----------------"


echo "Top 5 Processes by CPU Usage"
wmic path win32_perfformatteddata_perfproc_process get IDProcess,Name,PercentProcessorTime | sort -k3 -nr | head -n 6
echo "-----------------"


read -p "Press Enter to close this window..."