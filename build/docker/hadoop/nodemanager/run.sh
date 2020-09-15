#!/bin/bash

# shellcheck disable=SC2154
data_dir=$(echo "$HDFS_CONF_dfs_datanode_data_dir" | perl -pe 's#file://##')
if [ ! -d "$data_dir" ]; then
  echo "Datanode data directory not found: $data_dir"
  exit 2
fi

# shellcheck disable=SC2086
$HADOOP_HOME/bin/hdfs --config "$HADOOP_CONF_DIR" datanode
