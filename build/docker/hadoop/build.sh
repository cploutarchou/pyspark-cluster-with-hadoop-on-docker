#!/bin/bash
mkdir -p /root/.ssh/authorized_keys
chmod 0600 /root/.ssh/authorized_keys
ssh-keygen -q -t rsa -N '' -f /root/.ssh/ssh/id_rsa <<<y 2>&1 >/dev/null
cat /root/.ssh/id_rsa.pub >>/root/.ssh/authorized_key
eval "$(ssh-agent -s)"
hdfs namenode -format
start-dfs.sh && start-yarn.sh && hdfs dfs -mkdir -p /user/root
hdfs dfs -put /usr/local/hadoop/etc/hadoop/ input
