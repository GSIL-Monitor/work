#!/bin/bash
#for server in $(seq 8)
#do
#PGPASSWORD=ajtrq4iqtf psql -h10.188.20.131 -Upostgres -d 3kingdoms-s${server} -c "with paypid as (select distinct(pid) as pid from payorder where mock=false order by pid) select 's${n}' as server,paypid.pid,base_info.gold from paypid,base_info where paypid.pid=base_info.pid;"
#done | sed -e 's/|/,/g' -e '/^$/d' >> pay_user_remain_gold.csv

#for n in $(seq 8)
#do
#PGPASSWORD=ajtrq4iqtf psql -t -h10.188.20.131 -Upostgres -d 3kingdoms-s${n}  -c "with payinfo as (select pid,sum(gold) as pay_gold from payorder where mock = false and pay_time <1541692800 group by pid order by pid) select 's$n' as server, payinfo.pid, payinfo.pay_gold,base_info.gold as remain_gold from payinfo,base_info where payinfo.pid=base_info.pid;"
#done | sed -e 's/|/,/g' -e '/^$/d' >> user_pay_remain_gold.csv

for n in $(seq 8)
do
PGPASSWORD=ajtrq4iqtf psql -t -h10.188.20.131 -Upostgres -d 3kingdoms-s${n} \
-c "with payinfo as (select pid,sum(gold) as pay_gold,sum(money) as pay_money from payorder where mock = false and pay_time <1541692800 group by pid order by pid) select 's$n' as server, payinfo.pid, payinfo.pay_gold,payinfo.pay_money,base_info.gold as remain_gold,account.username,to_timestamp(access.last_op_time) as last_login from payinfo,base_info,account,access where payinfo.pid=base_info.pid and payinfo.pid=account.pid and payinfo.pid=access.pid;"
done | sed -e 's/|/,/g' -e '/^$/d' >> user_gold_money_logintime.csv

#CSV文件格式：服务器，玩家ID，充值获得钻石数，总充值金额，剩余钻石数，角色名，最后登录时间
