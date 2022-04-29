while true 
do 
/var/www/html/pages/system/autobackup.sh
echo "OK $now" >> logback.txt
echo "300 segundos!" 
sleep 300
done
