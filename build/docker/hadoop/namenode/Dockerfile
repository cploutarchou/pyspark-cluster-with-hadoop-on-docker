FROM cploutarchou/hadoop-base:hadoop-main

LABEL maintainer="Christos Ploutarchou<cploutarchou@gmail.com>"

HEALTHCHECK CMD curl -f http://localhost:9870/ || exit 1

ENV HDFS_CONF_dfs_namenode_name_dir=file:///hadoop/dfs/name
RUN mkdir -p /hadoop/dfs/name
VOLUME /hadoop/dfs/name

ADD /build/docker/hadoop/namenode/build.sh /build.sh
RUN chmod a+x /build.sh

EXPOSE 9870

CMD ["/build.sh"]