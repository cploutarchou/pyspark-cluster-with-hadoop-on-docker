#!/bin/bash

# shellcheck disable=SC2223
: ${HADOOP_HOME="/usr/local/hadoop"}

service ssh start
# format namenode
yes | "$HADOOP_HOME"/bin/hdfs namenode -format
"$HADOOP_HOME"/sbin/start-all.sh
"$HADOOP_HOME"/sbin/mr-jobhistory-daemon.sh start historyserver

if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
  /bin/bash
fi
