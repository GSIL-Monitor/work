#!/bin/bash

###########混服###########
for i in 353 414 437 479 490 495 501 504 511 517 524 529 531 535 537 543 544 546 547 548 549 551 552 554 556 557 559 560 562 563 565 566 568 569 571 572 574 578 579 582 583 586 589 593 598;do

mysql -uroot -S /tmp/mysql3309.sock -e 'create database seer_game'${i}''

mysql -uroot -S /tmp/mysql3309.sock seer_game${i}</data3/backup/seer_game${i}_20181219.sql
    if [ $? -eq 0 ];then
        echo "seer_game${i} is ok"
    fi

done


#########应用宝###########
for i in 6 26 89 93 113 129 132 139 140 142 143 145 146 148 149 151 153 154 156;do

mysql -uroot -S /tmp/mysql3309.sock -e 'create database seeryyb_game'${i}''

mysql -uroot -S /tmp/mysql3309.sock seeryyb_game${i}</data3/backup/seeryyb_game${i}_20181219.sql
    if [ $? -eq 0 ];then
        echo "seeryyb_game${i} is ok"
    fi

done

############APP###########
for i in 116 117 118 119 121 122 124;do

mysql -uroot -S /tmp/mysql3309.sock -e 'create database seerapp_game'${i}''

mysql -uroot -S /tmp/mysql3309.sock seerapp_game${i}</data3/backup/seerapp_game${i}_20181219.sql
    if [ $? -eq 0 ];then
        echo "seerapp_game${i} is ok"
    fi

done

###########4399##########
for i in 26 93 132 136 155 156 158 159 160 162 163 164 166 167 169;do

mysql -uroot -S /tmp/mysql3309.sock -e 'create database seer4399_game'${i}''

mysql -uroot -S /tmp/mysql3309.sock seer4399_game${i}</data3/backup/seer4399_game${i}_20181219.sql
    if [ $? -eq 0 ];then
        echo "seer4399_game${i} is ok"
    fi

done
