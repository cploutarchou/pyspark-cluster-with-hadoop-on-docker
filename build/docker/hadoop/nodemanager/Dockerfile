FROM cploutarchou/hadoop-base:hadoop-main

LABEL maintainer="Christos Ploutarchou<cploutarchou@gmail.com>"

HEALTHCHECK CMD curl -f http://localhost:8042/ || exit 1

ADD /build/docker/hadoop/nodemanager/build.sh /build.sh
RUN chmod a+x /build.sh

EXPOSE 8042

CMD ["/build.sh"]