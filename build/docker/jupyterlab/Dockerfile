FROM base
LABEL maintainer="Christos Ploutarchou <cploutarchou@gmail.com>"



ARG build_date

LABEL org.label-schema.build-date=${build_date}
LABEL org.label-schema.name="pySpark Cluster on Docker - JupyterLab Image"
LABEL org.label-schema.description="JupyterLab image"
LABEL org.label-schema.url="https://github.com/cploutarchou/pyspark-cluster-with-hadoop-on-docker"
LABEL org.label-schema.vcs-url="https://github.com/cploutarchou/pyspark-cluster-with-hadoop-on-docker/build/docker/jupyterlab/Dockerfile"
LABEL org.label-schema.schema-version="1.0.0"

# Python kernel for PySpark

RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev && \
    pip3 install --upgrade pip && \
    pip3 install pyspark jupyterlab

# -- Runtime

EXPOSE 8888
WORKDIR ${SHARED_WORKSPACE}
ADD workspace/ ${SHARED_WORKSPACE}/

CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=