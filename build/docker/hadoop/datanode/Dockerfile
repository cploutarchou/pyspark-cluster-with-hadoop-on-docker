FROM cploutarchou/hadoop-base:hadoop-main

LABEL maintainer="Christos Ploutarchou<cploutarchou@gmail.com>"


HEALTHCHECK CMD curl -f http://localhost:9864/ || exit 1

ENV HDFS_CONF_dfs_datanode_data_dir=file:///hadoop/dfs/data
RUN mkdir -p /hadoop/dfs/data
VOLUME /hadoop/dfs/data

ADD /build/docker/hadoop/datanode/build.sh /build.sh
RUN chmod a+x /build.sh

EXPOSE 9864

CMD ["/build.sh"]