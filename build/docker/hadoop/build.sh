#!/bin/bash
# Run ssh on logging, only if not running yet
ACTIVE=$(pgrep -f /usr/sbin/sshd)
if [ ! "$ACTIVE" ]; then
  echo "starting sshd...."

  echo "successfully started PID = $(pgrep -f /usr/sbin/sshd)"
else
  echo "ssh service already started PID=$ACTIVE"
fi

mkdir -p ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys
ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa <<<y
cat ~/.ssh/id_rsa.pub >>~/.ssh/authorized_key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
start-all.sh hdfs dfs -mkdir /user hdfs dfs -mkdir /user/hadoop
