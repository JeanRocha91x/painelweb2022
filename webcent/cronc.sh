while true 
do 
  /usr/bin/php /var/www/html/pages/system/cron.php
  /usr/bin/php /var/www/html/pages/system/cron.ssh.php
  /usr/bin/php /var/www/html/pages/system/cron.servidor.php
  /usr/bin/php /var/www/html/pages/system/cron.rev.php
  ./cronb.sh
  /usr/bin/php /var/www/html/pages/system/cron.online.ssh.php
  echo "10 segundos!" 
sleep 10
done