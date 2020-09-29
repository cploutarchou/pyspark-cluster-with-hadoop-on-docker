#!/bin/bash

HADOOP_PREFIX:=/usr/local/hadoop

sed s/HOSTNAME/"$HOSTNAME"/ /usr/local/hadoop/etc/hadoop/core-site.xml.template >/usr/local/hadoop/etc/hadoop/core-site.xml

service sshd start
"$HADOOP_PREFIX"/sbin/start-dfs.sh
"$HADOOP_PREFIX"/sbin/start-yarn.sh
"$HADOOP_PREFIX"/sbin/mr-jobhistory-daemon.sh start historyserver

if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
  /bin/bash
fi
