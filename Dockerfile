FROM postgres
MAINTAINER mateuyabar@equinox.one

COPY postgres-backup-cron /etc/cron.d/postgres-backup-cron
RUN touch /var/log/cron.log
ADD backup.sh bin/backup.sh
ADD start.sh bin/start.sh
ADD restore.sh bin/restore.sh
 
CMD ["start.sh"]