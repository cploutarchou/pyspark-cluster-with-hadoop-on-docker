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

EXPOSE 8080
spark_version="3.0.1"
hadoop_version="3.2"
spark_path = "/usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}"
CMD ${spark_path}/bin/spark-class org.apache.spark.deploy.worker.Worker spark://127.0.0.1:7077 >> logs/spark-worker.out