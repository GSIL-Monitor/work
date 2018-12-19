#!/bin/bash
grep -v ^# /tmp/all.db | while read ip port dbname
do
mysqldump -useer -ppassword --set-gtid-purged=OFF -h${ip} -P${port} ${dbname} > /data3/backup/${dbname}_`date +%Y%m%d`.sql
#mysql -useer -ppassword -h${ip} -P${port} ${dbname} -e "select user,password,host from mysql.user where user='repl';"
if [ $? -eq 0 ];then
   echo "$dbname export success." | tee -a /tmp/mysqldump_ok_`date +%Y%m%d`.log
   #echo "${ip} ${port} ${dbname}"
else
   echo "$dbname export failed." | tee -a /tmp/mysqldump_fail_`date +%Y%m%d`.log
fi
done
