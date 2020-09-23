# -- Software Stack Version

SPARK_VERSION="3.0.1"
HADOOP_VERSION="3.2"

# -- Building the Images

docker build \
  -f build/docker/spark/base/Dockerfile \
  -t build/docker/spark/base .

docker build \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg hadoop_version="${HADOOP_VERSION}" \
  -f build/docker/spark/spark-base-image/Dockerfile \
  -t build/docker/spark/spark-base-image .

docker build \
  -f build/docker/spark/spark-master/Dockerfile \
  -t build/docker/spark/spark-master .

docker build \
  -f build/docker/spark/spark-master/Dockerfile \
  -t build/docker/spark/spark-master .
