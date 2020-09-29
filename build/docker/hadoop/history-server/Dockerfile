FROM cploutarchou/hadoop-base:hadoop-main

LABEL maintainer="Christos Ploutarchou<cploutarchou@gmail.com>"

HEALTHCHECK CMD curl -f http://localhost:8188/ || exit 1

ENV YARN_CONF_yarn_timeline___service_leveldb___timeline___store_path=/hadoop/yarn/timeline
RUN mkdir -p /hadoop/yarn/timeline
VOLUME /hadoop/yarn/timeline

ADD /build/docker/hadoop/history-server/build.sh /build.sh
RUN chmod a+x /build.sh

EXPOSE 8188

CMD ["/build.sh"]