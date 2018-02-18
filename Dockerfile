FROM ubuntu:latest

RUN apt-get -y update && apt-get -y install cron

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
    build-essential \
    ca-certificates \
    gcc \
    git \
    libpq-dev \
    make \
    python-pip \
    python2.7 \
    python2.7-dev \
    ssh \
    && pip install pytz \
    && pip install requests \
    && pip install github3.py \
    && apt-get autoremove \
    && apt-get clean

ADD entrypoint.sh /entrypoint.sh
ADD slack_pull_reminder.py /root/slack_pull_reminder.py
RUN chmod +x /root/slack_pull_reminder.py

RUN touch /var/log/cron.log

ENTRYPOINT ./entrypoint.sh