#!/bin/bash

source /pgenv.sh

export MYPGDATABASE=$PGDATABASE
PGDATABASE=

if [ $# -gt 0 ]; then
	psql -c "drop database ${MYPGDATABASE}"
	pg_restore $1 --create -d postgres
else
    echo "You need to indicate backup path"
fi