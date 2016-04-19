#!/bin/bash

source /pgenv.sh

#echo "Running with these environment options" >> /var/log/cron.log
#set | grep PG >> /var/log/cron.log

MYDATE=`date +%Y%m%d-%H%M`
MONTH=$(date +%m)
YEAR=$(date +%Y)
MYBASEDIR=/backup
MYBACKUPDIR=${MYBASEDIR}/${YEAR}/${MONTH}
mkdir -p ${MYBACKUPDIR}
cd ${MYBACKUPDIR}

echo "Backup running to $MYBACKUPDIR" >> /var/log/cron.log


echo "Backing up $DB"  >> /var/log/cron.log
FILENAME=${MYBACKUPDIR}/${DUMPPREFIX}${PGDATABASE}.${MYDATE}.dmp
pg_dump -f ${FILENAME} -d ${PGDATABASE} -O
