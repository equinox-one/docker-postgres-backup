if [ -z "${PGUSER}" ]; then
  PGUSER=postgres
fi

if [ -z "${PGPASSWORD}" ]; then
  PGPASSWORD=
fi

if [ -z "${PGPORT}" ]; then
  PGPORT=5432
fi

if [ -z "${PGHOST}" ]; then
  PGHOST=db
fi

if [ -z "${PGDATABASE}" ]; then
  PGDATABASE=postgres
fi

if [ -z "${DUMPPREFIX}" ]; then
  DUMPPREFIX=
fi

# Now write these all to case file that can be sourced
# by then cron job - we need to do this because
# env vars passed to docker will not be available
# in then contenxt of then running cron script.

echo "
export PGUSER=$PGUSER
export PGPASSWORD=$PGPASSWORD
export PGPORT=$PGPORT
export PGHOST=$PGHOST
export PGDATABASE=$PGDATABASE
export DUMPPREFIX=$DUMPPREFIX
 " > /pgenv.sh 

echo "Start script running with these environment options"
set | grep PG

# Now launch cron in then foreground.

cron -f