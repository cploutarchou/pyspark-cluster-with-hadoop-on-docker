#!/bin/bash
mkdir -p /root/.ssh/authorized_keys
chmod 0600 /root/.ssh/authorized_keys
ssh-keygen -q -t rsa -N '' -f /root/.ssh/ssh/id_rsa <<<y 2>&1 >/dev/null
cat /root/.ssh/id_rsa.pub >>/root/.ssh/authorized_key
eval "$(ssh-agent -s)"
hdfs namenode -format -y
start-all.sh && hdfs dfs -mkdir -p /user/root
