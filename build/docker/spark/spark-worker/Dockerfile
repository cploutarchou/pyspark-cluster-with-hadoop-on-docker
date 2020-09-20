ARG spark_version="3.0.1"
ARG hadoop_version="3.2"
FROM cploutarchou/spark-base:spark-base-image
LABEL maintainer="Christos Ploutarchou<cploutarchou@gmail.com>"

# -- Layer: Image Metadata

ARG build_date=date+"%Y-%m-%d %T"

LABEL org.label-schema.build-date=${build_date}
LABEL org.label-schema.name="Spark Cluster on Docker - Spark Worker Image"
LABEL org.label-schema.description="Spark master image"
LABEL org.label-schema.url="https://github.com/cploutarchou/pyspark-cluster-with-hadoop-on-docker"
LABEL org.label-schema.schema-version="1.0"


# -- Runtime
ENV JAVA_HOME=/usr/lib/jvm/adoptopenjdk-8-hotspot-amd64
ENV SPARK_MASTER_HOST 127.0.0.1
ENV SPARK_MASTER_PORT 7077
EXPOSE 8080

CMD bin/spark-class org.apache.spark.deploy.worker.Worker spark://${SPARK_MASTER_HOST}:${SPARK_MASTER_PORT} >> logs/spark-worker.out