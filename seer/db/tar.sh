#!/bin/bash
#
cd /data3/backup
file=`ls ./*.sql`

for i in $file;do

    tar zcvf ${i%.*}.tgz $i

done
