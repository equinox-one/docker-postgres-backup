#Postgres Backup Docker Container
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

This docker is based on this one: https://github.com/kartoza/docker-pg-backup