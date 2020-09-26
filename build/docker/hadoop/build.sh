#!/bin/bash

eval "$(ssh-agent -s)"
ssh-keygen -t rsa -k id_rsa
cat ~/.ssh/id_rsa.pub >>~/.ssh/authorized_key
ssh localhost  $HADOOP_HOME/bin/hdfs namenode -format $HADOOP_HOME/sbin/start-dfs.sh && $HADOOP_HOME/sbin/start-yarn.sh && hdfs dfs -mkdir -p /user/root && $HADOOP_HOME/bin/hdfs dfs -put $HADOOP_HOME/etc/hadoop/ input
jps
