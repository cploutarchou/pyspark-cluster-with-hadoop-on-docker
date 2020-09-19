FROM openjdk:8-jre-buster
LABEL maintainer="Christos Ploutarchou<cploutarchou@gmail.com>"

# -- Layer: Image Metadata

ARG build_date=date+"%Y-%m-%d %T"

LABEL org.label-schema.build-date=${build_date}
LABEL org.label-schema.name="Spark Cluster on Docker - Base Image"
LABEL org.label-schema.description="Spark master image"
LABEL org.label-schema.url="https://github.com/cploutarchou/pyspark-cluster-with-hadoop-on-docker"
LABEL org.label-schema.schema-version="1.0"
# -- Layer: OS + Python


ARG shared_workspace=/opt/workspace
ARG logs_dir=/logs/spark-master/

RUN mkdir -p ${shared_workspace}/data && \
    mkdir -p /usr/share/man/man1 && \
    apt-get update -y && \
    apt-get install -y curl python3 r-base && \
    ln -s /usr/bin/python3 /usr/bin/python

ENV SHARED_WORKSPACE=${shared_workspace}
ENV LOG_DIR=${logs_dir}

# -- Runtime

VOLUME ${shared_workspace}
VOLUME ${logs_dir}
CMD ["bash"]