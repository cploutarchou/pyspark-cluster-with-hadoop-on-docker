FROM cploutarchou/hadoop-base:hadoop-base

MAINTAINER Christos Ploutarchou<cploutarchou@gmail.com>

HEALTHCHECK CMD curl -f http://172.28.1.3:8088/ || exit 1

ADD /build/docker/hadoop/resourcemanager/run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8088

CMD ["/run.sh"]