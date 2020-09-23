ARG spark_version="3.0.1"
ARG hadoop_version="3.2"
FROM cploutarchou/spark-base:spark-base-image
LABEL maintainer="Christos Ploutarchou<cploutarchou@gmail.com>"

# -- Runtime

ARG spark_master_web_ui=8080

EXPOSE ${spark_master_web_ui} ${SPARK_MASTER_PORT}
CMD bin/spark-class org.apache.spark.deploy.master.Master >> logs/spark-master.out