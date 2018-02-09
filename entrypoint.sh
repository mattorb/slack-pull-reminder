#!/bin/bash
printenv | grep -v no_proxy | sed 's/^\(.*\)$/export \1/g' >> /root/project_env.sh
chmod +x /root/project_env.sh
cron && tail -f /var/log/cron.log
