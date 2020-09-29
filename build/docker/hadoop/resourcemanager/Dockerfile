FROM cploutarchou/hadoop-base:hadoop-main

LABEL maintainer="Christos Ploutarchou<cploutarchou@gmail.com>"

HEALTHCHECK CMD curl -f http://localhost:8088/ || exit 1

ADD /build/docker/hadoop/resourcemanager/build.sh /build.sh
RUN chmod a+x /build.sh

EXPOSE 8088

CMD ["/build.sh"]
