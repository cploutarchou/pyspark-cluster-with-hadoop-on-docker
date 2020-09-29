#!/bin/bash

HADOOP_PREFIX=/usr/local/hadoop

service sshd start
"$HADOOP_PREFIX"/sbin/start-dfs.sh
"$HADOOP_PREFIX"/sbin/start-yarn.sh
"$HADOOP_PREFIX"/sbin/mr-jobhistory-daemon.sh start historyserver
