FROM ubuntu:latest

ADD entrypoint.sh /entrypoint.sh
RUN touch /var/log/cron.log

RUN apt-get -y update && apt-get -y install cron

ENTRYPOINT ./entrypoint.sh