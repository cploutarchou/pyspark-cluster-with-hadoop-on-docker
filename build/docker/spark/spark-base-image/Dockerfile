FROM debian:9

LABEL maintainer="Christos Ploutarchou<cploutarchou@gmail.com>"

ARG build_date=date+"%Y-%m-%d %T"

LABEL org.label-schema.build-date=${build_date}
LABEL org.label-schema.name="Spark Cluster on Docker - Spark Master Image"
LABEL org.label-schema.description="Spark master image"
LABEL org.label-schema.url="https://github.com/cploutarchou/pyspark-cluster-with-hadoop-on-docker"
LABEL org.label-schema.schema-version="1.0"

# -- Layer: Apache Spark
RUN sudo apt-get install curl


ARG spark_version="3.0.1"
ARG hadoop_version="3.2"

ENV SPARK_URL https://archive.apache.org/dist/spark/spark-${spark_version}/spark-${spark_version}-bin-hadoop${hadoop_version}.tgz

RUN set -x && curl -fSL "$SPARK_URL" -o /tmp/spark.tgz \
    && tar -xf /tmp/spark.tgz && mv spark-${spark_version}-bin-hadoop${hadoop_version} /usr/bin/ \
    && echo "alias pyspark=/usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}/bin/pyspark" >> ~/.bashrc \
    && echo "alias spark-shell=/usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}/bin/spark-shell" >> ~/.bashrc \
    && mkdir /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}/logs \
    && rm /tmp/spark.tgz


ENV SPARK_HOME /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}
ENV SPARK_MASTER_HOST spark-master
ENV SPARK_MASTER_PORT 7077
ENV PYSPARK_PYTHON python3

# -- Runtime

WORKDIR ${SPARK_HOME}