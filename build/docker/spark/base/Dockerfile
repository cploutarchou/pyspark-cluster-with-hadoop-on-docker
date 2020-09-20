FROM ubuntu:focal
LABEL maintainer="Christos Ploutarchou<cploutarchou@gmail.com>"

# -- Layer: Image Metadata

ARG build_date=date+"%Y-%m-%d %T"

LABEL org.label-schema.build-date=${build_date}
LABEL org.label-schema.name="Spark Cluster on Docker - Base Image"
LABEL org.label-schema.description="Spark master image"
LABEL org.label-schema.url="https://github.com/cploutarchou/pyspark-cluster-with-hadoop-on-docker"
LABEL org.label-schema.schema-version="1.0"

# -- Set TZ Timezone
ENV TZ=Asia/Nicosia
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# -- Install wget
RUN  apt-get update \
  && apt-get install -y wget \
  && apt-get install -y software-properties-common

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn
# -- Layer: OS + Python


ARG shared_workspace=/opt/workspace
ARG logs_dir=/logs/spark-master/

RUN mkdir -p ${shared_workspace}/data
RUN mkdir -p ${logs_dir}/

RUN apt-get update
RUN wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -
RUN add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
RUN apt-get update
RUN apt-get install -y adoptopenjdk-8-hotspot

# Install python3.6
RUN add-apt-repository --yes ppa:deadsnakes/ppa
RUN apt update
RUN apt install -y python3.6
RUN apt install -y python3.6-dev


RUN rm -rf /var/lib/apt/lists/


ENV SHARED_WORKSPACE=${shared_workspace}
ENV LOG_DIR=${logs_dir}
ENV JAVA_HOME=/usr/lib/jvm/adoptopenjdk-8-hotspot-amd64

# -- Runtime

VOLUME ${shared_workspace}
VOLUME ${logs_dir}
CMD ["bash"]