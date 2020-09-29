#!/bin/bash

HADOOP_PREFIX=/usr/local/hadoop

ufw allow ssh
systemctl restart ssh.service
mkdir /usr/local/hadoop-2.10.1/logs/
chmod -rwxr-xr-x /usr/local/hadoop-2.10.1/logs/
"$HADOOP_PREFIX"/sbin/start-dfs.sh
"$HADOOP_PREFIX"/sbin/start-yarn.sh
"$HADOOP_PREFIX"/sbin/mr-jobhistory-daemon.sh start historyserver
