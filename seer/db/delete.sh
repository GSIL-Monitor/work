#!/bin/bash
#delete

/bin/find /data1/backup/ -type d  -mtime +1 |xargs /bin/rm -fr
