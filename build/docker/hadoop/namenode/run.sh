#!/bin/bash

# shellcheck disable=SC2154
name_dir=$(echo "$HDFS_CONF_dfs_namenode_name_dir" | perl -pe 's#file://##')
if [ ! -d "$name_dir" ]; then
  echo "Namenode name directory not found: $name_dir"
  exit 2
fi

if [ -z "$CLUSTER_NAME" ]; then
  echo "Cluster name not specified"
  exit 2
fi

echo "remove lost+found from $name_dir"
rm -r "$name_dir"/lost+found

if [ "$(ls -A "$name_dir")" == "" ]; then
  echo "Formatting namenode name directory: $name_dir"
  "$HADOOP_HOME"/bin/hdfs --config "$HADOOP_CONF_DIR" namenode -format "$CLUSTER_NAME"
fi

"$HADOOP_HOME"/bin/hdfs --config "$HADOOP_CONF_DIR" namenode
