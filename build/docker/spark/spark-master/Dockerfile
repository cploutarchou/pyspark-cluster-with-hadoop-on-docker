ARG spark_version="3.0.1"
ARG hadoop_version="3.2"
FROM cploutarchou/spark-base:base-image

LABEL maintainer="Christos Ploutarchou<cploutarchou@gmail.com>"

# -- Layer: Image Metadata

ARG build_date=date+"%Y-%m-%d %T"

LABEL org.label-schema.build-date=${build_date}
LABEL org.label-schema.name="Spark Cluster on Docker - Spark Master Image"
LABEL org.label-schema.description="Spark master image"
LABEL org.label-schema.url="https://github.com/cploutarchou/pyspark-cluster-with-hadoop-on-docker"
LABEL org.label-schema.schema-version="1.0"

# -- Runtime
ENV JAVA_HOME=/usr/lib/jvm/adoptopenjdk-8-hotspot-amd64

EXPOSE 8080 7077

ARG spark_path="/usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}"

CMD {spark_path}/bin/spark-class starting org.apache.spark.deploy.master.Master, logging to log_file logs/spark-master.out