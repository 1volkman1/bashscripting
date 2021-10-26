#! /usr/bin/env bash
dir=$HOME/mylogs 

for i in `find $dir -maxdepth 1 -not -type d |sed 's#.*/##'`;do
error=$(grep -c 'error' $dir/$i)
echo "Errors: $error"
failure=$(grep -c 'failure' $dir/$i)
echo "Failures: $failure"
alert=$(grep -c 'alert' $dir/$i)
echo "Alerts: $alert"
warning=$(grep -c 'warning' $dir/$i)
echo "Warninigs: $warning"
countline=$(wc -l < $dir/$i)
echo "Lines in file : $countline"
declare -i allfails=error+failure
echo "Count failure  + error:  $allfails"
pr_fails=$(awk "BEGIN { pc=100*${allfails}/${countline}; i=int(pc); print (pc-i<0.5)?i:i+1 }")
echo "Persintage of ‘error’ and ‘failure’ in $i: $pr_fails "
declare -i allwarning=warning+alert
echo "Count warning  + alert:  $allwarning"
pr_warning=$(awk "BEGIN { pc=100*${allwarning}/${countline}; i=int(pc); print (pc-i<0.5)?i:i+1 }")
echo "Persintage of ‘warning’ and ‘alert’ in $i: $pr_warning"
if [ $pr_fails -gt 10 ]
then
  zip -mq $dir/unhealthy/$i.zip $dir/$i
elif [ $pr_warning -gt 20 ] && [ $pr_fails -le 10 ]
then
 zip -mq $dir/unstable/$i.zip $dir/$i
else
 zip -mq $dir/healthy/$i.zip $dir/$i
fi
done
echo -e "\033[1;31munhealthy|$(ls $dir/unhealthy/| tr '\r\n' ' ')\033[0m"
echo -e "\033[1;33munstable|$(ls $dir/unstable/| tr '\r\n' ' ')\033[0m"
echo -e "\033[1;32mhealthy|$(ls $dir/healthy/| tr '\r\n' ' ')\033[0m"
