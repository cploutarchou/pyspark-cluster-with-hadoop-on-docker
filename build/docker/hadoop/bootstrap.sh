#!/bin/bash

HADOOP_PREFIX=/usr/local/hadoop


"$HADOOP_PREFIX"/sbin/start-all.sh
"$HADOOP_PREFIX"/sbin/mr-jobhistory-daemon.sh start historyserver
