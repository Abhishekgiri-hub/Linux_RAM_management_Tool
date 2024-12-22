while :
do
	total_mem=`free -m | head -2 | tail -1 | awk '{print $2}'`
	
	used_mem=`free -m | head -2 | tail -1 | awk '{print $3}'`
	
	mem_used_percentage=`expr $used_mem \* 100 / $total_mem` 
	
	echo "`date +"%r %D"`   $mem_used_percentage" >> mem_report.tsv
	
	if [[ $mem_used_percentage -ge 80 ]]
	then
		echo "security alert for memory " | espeak-ng
		exit 	
	fi
	sleep 15
done
