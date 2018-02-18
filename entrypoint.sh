#!/bin/bash
printenv | grep -v CRON_EXPR | grep -v no_proxy | sed 's/^\(.*\)$/export \1/g' >> /root/project_env.sh
chmod +x /root/project_env.sh

if [[ -z $CRON_EXPR ]]; then
    CRON_EXPR='0 10 * * *'
fi

set -f 
echo Setting Schedule to $CRON_EXPR
set +f

cat << EOF > /etc/cron.d/hello-cron
$CRON_EXPR root . /root/project_env.sh; python /root/slack_pull_reminder.py >> /var/log/cron.log 2>&1
# An empty line is required at the end of this file for a valid cron file.

EOF
chmod 0644 /etc/cron.d/hello-cron

cron && tail -f /var/log/cron.log
