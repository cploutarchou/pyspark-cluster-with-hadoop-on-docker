FROM cploutarchou/hadoop-base:hadoop-base

MAINTAINER Christos Ploutarchou<cploutarchou@gmail.com>

HEALTHCHECK CMD curl -f http://localhost:8031/ || exit 1

ADD /build/docker/hadoop/resourcemanager/run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8031

CMD ["/run.sh"]