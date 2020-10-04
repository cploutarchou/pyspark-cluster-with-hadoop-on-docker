#!/bin/bash

# shellcheck disable=SC2223
: ${HADOOP_HOME="/usr/local/hadoop"}

rm /tmp/*.pid

service ssh start
"$HADOOP_HOME"/sbin/start-dfs.sh
"$HADOOP_HOME"/sbin/start-yarn.sh
"$HADOOP_HOME"/sbin/mr-jobhistory-daemon.sh start historyserver

if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
  /bin/bash
fi
