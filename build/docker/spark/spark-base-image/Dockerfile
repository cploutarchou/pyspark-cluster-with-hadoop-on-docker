FROM cploutarchou/spark-base:base-image

LABEL maintainer="Christos Ploutarchou<cploutarchou@gmail.com>"

ARG build_date=date+"%Y-%m-%d %T"

LABEL org.label-schema.build-date=${build_date}
LABEL org.label-schema.name="Spark Cluster on Docker - Spark Master Image"
LABEL org.label-schema.description="Spark master image"
LABEL org.label-schema.url="https://github.com/cploutarchou/pyspark-cluster-with-hadoop-on-docker"
LABEL org.label-schema.schema-version="1.0"

# Install prerequisites
RUN apt-get update && apt-get install -y \
curl
CMD /bin/bash

# -- Layer: Apache Spark

ARG spark_version="3.0.1"
ARG hadoop_version="3.2"

ENV SPARK_URL https://archive.apache.org/dist/spark/spark-${spark_version}/spark-${spark_version}-bin-hadoop${hadoop_version}.tgz

RUN set -x && curl -fSL "$SPARK_URL" -o /tmp/spark.tgz \
    && tar -xf /tmp/spark.tgz && mv spark-${spark_version}-bin-hadoop${hadoop_version} /usr/bin/ \
    && echo "export JAVA_HOME=/usr/lib/jvm/adoptopenjdk-8-hotspot-amd64" >> ~/.bashrc \
    && echo "export SPARK_HOME=/usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}" >> ~/.bashrc \
    && echo "export SPARK_MASTER_HOST=localhost"  >> ~/.bashrc \
    && echo "export PATH=/usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}/bin" >> ~/.bashrc \
    && echo "export PYTHONPATH=/usr/bin/python3.6" >> ~/.bashrc \
    && echo "export PYSPARK_PYTHON=/usr/bin/python3.6" >> ~/.bashrc \
    && echo "export SPARK_MASTER_PORT=7077" >> ~/.bashrc \
    && echo "export PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH" >> ~/.bashrc \
    && mkdir /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}/logs \
    && rm /tmp/spark.tgz

# -- Runtime
WORKDIR /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}