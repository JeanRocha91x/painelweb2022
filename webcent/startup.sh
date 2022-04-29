#!/bin/bash
/usr/sbin/iptables -t nat -F && /usr/sbin/iptables -F
screen -dmS clean /root/clean.sh
screen -dmS cron /root/cronc.sh
screen -dmS backupsql /root/backupsql.sh