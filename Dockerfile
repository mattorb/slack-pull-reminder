FROM ubuntu:latest

ADD crontab /etc/cron.d/hello-cron
ADD entrypoint.sh /entrypoint.sh
RUN chmod 0644 /etc/cron.d/hello-cron
RUN touch /var/log/cron.log

RUN apt-get -y update && apt-get -y install cron

ENTRYPOINT ./entrypoint.sh