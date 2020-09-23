ARG spark_version="3.0.1"
ARG hadoop_version="3.2"
FROM cploutarchou/spark-base:spark-base-image
LABEL maintainer="Christos Ploutarchou<cploutarchou@gmail.com>"

# -- Runtime

ARG spark_worker_web_ui=8081

EXPOSE ${spark_worker_web_ui}
CMD bin/spark-class org.apache.spark.deploy.worker.Worker spark://${SPARK_MASTER_HOST}:${SPARK_MASTER_PORT} >> logs/spark-worker.out
