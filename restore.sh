#!/bin/bash

source /pgenv.sh

export MYPGDATABASE=$PGDATABASE
PGDATABASE=

if [ $# -gt 0 ]; then
	psql -c "drop database ${MYPGDATABASE}"
	psql -c "create database ${MYPGDATABASE}"
	psql ${MYPGDATABASE} < $1
else
    echo "You need to indicate the path of the backup to restore"
fi