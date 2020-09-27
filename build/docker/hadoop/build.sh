#!/bin/bash
eval "$(ssh-agent -s)"
readlink -f $(which java)
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa -f -y
chmod 0600 ~/.ssh/authorized_keys
cat ~/.ssh/id_rsa.pub >>~/.ssh/authorized_key
hdfs namenode -format
"$HADOOP_HOME"/sbin/start-dfs.sh && "$HADOOP_HOME"/sbin/start-yarn.sh && hdfs dfs -mkdir -p /user/root
"$HADOOP_HOME"/bin/hdfs dfs -put "$HADOOP_HOME"/etc/hadoop/ input
