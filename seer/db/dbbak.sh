#!/bin/bash
##dbbak

time=`date +%Y%m%d`
date=`date +%Y%m%d%H%M`
ip_addr=`/sbin/ifconfig eth1|grep "inet addr"|awk '{print $2}'|awk -F : '{print $2}'`
var=`ls /tmp|egrep 'mysql|sock'`

if [ ! -d /data1/backup/$time-$ip_addr ]
then
mkdir /data1/backup/$time-$ip_addr -p

fi


for i in $var;do 

if [[ $i == mysqlseer4399_game1.sock ]];then
/usr/local/mysql/bin/mysqldump --single-transaction -useer -pdsdxfsh2015seer -S /tmp/mysqlseer4399_game1.sock seer4399_game1 --tables grole gger gequip getc>/data1/backup/$time-$ip_addr/seer4399_game1_$date.sql
continue
fi

if [[ $i == mysqlseer4399_game2.sock ]];then
/usr/local/mysql/bin/mysqldump --single-transaction -useer -pdsdxfsh2015seer -S /tmp/mysqlseer4399_game2.sock seer4399_game2 --tables grole gger gequip getc>/data1/backup/$time-$ip_addr/seer4399_game2_$date.sql
continue
fi

if [[ $i == mysqlseer4399_platform.sock ]];then
/usr/local/mysql/bin/mysqldump --single-transaction -useer -pdsdxfsh2015seer -S /tmp/mysqlseer4399_platform.sock seer_platform --tables account>/data1/backup/$time-$ip_addr/seer4399_platform_$date.sql
continue
fi


if [[ $i == mysqlseer4399_game* ]];then

p=${i//[a-z]}

x=${p//'4399_'}

y=${x//'.'}

echo $y

if [[ $y -lt 10 ]];then

/usr/bin/innobackupex --user=root --password=dsdxfsh2015seer --sock=/tmp/mysqlseer4399_game$y.sock --defaults-group="mysqld300$y" --stream=tar /data1/backup/$time-$ip_addr 2>/data1/backup/$time-$ip_addr/seer4399_game${y}_error.log |gzip > /data1/backup/$time-$ip_addr/seer4399_game${y}_$date.tar.gz

elif [[  $y -gt 10 && $y -lt 100 ]];then

/usr/bin/innobackupex --user=root --password=dsdxfsh2015seer --sock=/tmp/mysqlseer4399_game$y.sock --defaults-group="mysqld30$y" --stream=tar /data1/backup/$time-$ip_addr 2>/data1/backup/$time-$ip_addr/seer4399_game${y}_error.log |gzip > /data1/backup/$time-$ip_addr/seer4399_game${y}_$date.tar.gz

else

/usr/bin/innobackupex --user=root --password=dsdxfsh2015seer --sock=/tmp/mysqlseer4399_game$y.sock --defaults-group="mysqld3$y" --stream=tar /data1/backup/$time-$ip_addr 2>/data1/backup/$time-$ip_addr/seer4399_game${y}_error.log |gzip > /data1/backup/$time-$ip_addr/seer4399_game${y}_$date.tar.gz

fi
fi
done

