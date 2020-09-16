FROM cploutarchou/hadoop-base:hadoop-base

LABEL maintainer="Christos Ploutarchou<cploutarchou@gmail.com>"+

HEALTHCHECK CMD curl -f http://localhost:8042/ || exit 1

ADD /build/docker/hadoop/nodemanager/run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8042

CMD ["/run.sh"]