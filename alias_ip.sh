#!/bin/bash
cat hf_alias_ip.info | while read id ip 
do
#cat << EOF >> /root/linux/seer_hw/hf_alias_ip_`date +%Y%m%d`.txt
cat << EOF >> /root/linux/seer_hw/all_alias_ip_`date +%Y%m%d`.txt
alias sshseer_game$id='ssh $ip' 
EOF
done



cat yyb_alias_ip.info | while read id ip 
do
#cat << EOF >> /root/linux/seer_hw/yyb_alias_ip_`date +%Y%m%d`.txt
cat << EOF >> /root/linux/seer_hw/all_alias_ip_`date +%Y%m%d`.txt
alias sshseeryyb_game$id='ssh $ip' 
EOF
done


cat app_alias_ip.info | while read id ip 
do
#cat << EOF >> /root/linux/seer_hw/app_alias_ip_`date +%Y%m%d`.txt
cat << EOF >> /root/linux/seer_hw/all_alias_ip_`date +%Y%m%d`.txt
alias sshseerapp_game$id='ssh $ip' 
EOF
done


cat 4399_alias_ip.info | while read id ip 
do
#cat << EOF >> /root/linux/seer_hw/4399_alias_ip_`date +%Y%m%d`.txt
cat << EOF >> /root/linux/seer_hw/all_alias_ip_`date +%Y%m%d`.txt
alias sshseer4399_game$id='ssh $ip' 
EOF
done


#cat hf_alias_ip_`date +%Y%m%d`.txt yyb_alias_ip_`date +%Y%m%d`.txt app_alias_ip_`date +%Y%m%d`.txt 4399_alias_ip_`date +%Y%m%d`.txt  > all_alias_ip_`date +%Y%m%d`.txt
