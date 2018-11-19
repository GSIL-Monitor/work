#!/bin/bash
for i in 334 405 479 517 531 533 549 550 551 552 557 558 559 572 577 582 584 587 590 594 599 604 612 621 626 631
do
#/usr/local/mysql/bin/mysqladmin -uroot -ppassword -S /tmp/mysqlseer_game$i.sock shutdown
#/usr/local/mysql/bin/mysqld_multi start $((3000+$i))
#/usr/local/mysql/bin/mysql -uroot -ppassword -S /tmp/mysqlseer_game$i.sock -e "show slave status\G"|grep "Seconds_Behind_Master" 
done
