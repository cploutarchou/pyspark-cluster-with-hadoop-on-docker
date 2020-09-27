#!/bin/bash
# Run ssh on logging, only if not running yet
ACTIVE=$(pgrep -f /usr/sbin/sshd)
if [ ! "$ACTIVE" ]; then
    echo "starting sshd....";

    echo "successfully started PID = $(pgrep -f /usr/sbin/sshd)";
else
    echo "ssh service already started PID=$ACTIVE"
fi
mkdir -p /root/.ssh/authorized_keys
chmod 0600 /root/.ssh/authorized_keys
ssh-keygen -q -t rsa -N '' -f /root/.ssh/ssh/id_rsa <<<y 2>&1 >/dev/null
cat /root/.ssh/id_rsa.pub >>/root/.ssh/authorized_key
eval "$(ssh-agent -s)"
start-all.sh hdfs dfs -mkdir /user hdfs dfs -mkdir /user/hadoop
