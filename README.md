# Postgres Backup Docker Container
Docker container that helps to create postgress db backups and restore them.

The default behaviour starts a cron that creates a backup every day executed at 3am.

Sample docker-compose file:
```yaml
version: '2'
services:
  db:
    image: postgres
    ports:
    - "5432"
  db_backup:
    image: equinox/postgres_backup:0.1
    depends_on:
      - db
    volumes:
      - ./backup:/backup
    environment:
      - PGUSER=postgres
      - PGPASSWORD=
      - PGPORT=5432
      - PGHOST=db
      - PGDATABASE=myapp_development  
```yml

## Restore from backup
There is an script to restore the database form a backup. *Be Careful!* it will delete existing database.
You will need the app that uses the bd to be stopped (so we can delete and create database).

docker-compose up db_backup
docker-compose exec db_backup restore.sh PATH_TO_BACKUP

The PATH_TO_BACKUP is inside the docker container.


## Thanks to
This docker is based on this one: https://github.com/kartoza/docker-pg-backup