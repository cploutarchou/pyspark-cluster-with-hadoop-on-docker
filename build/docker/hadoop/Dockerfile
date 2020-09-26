FROM ubuntu:19.10

LABEL maintainer="Christos Ploutarchou<cploutarchou@gmail.com>"

ARG build_date=date+"%Y-%m-%d %T"

LABEL org.label-schema.build-date=${build_date}
LABEL org.label-schema.name="Spark Cluster on Docker - Spark Master Image"
LABEL org.label-schema.description="Spark master image"
LABEL org.label-schema.url="https://github.com/cploutarchou/pyspark-cluster-with-hadoop-on-docker"
LABEL org.label-schema.schema-version="1.0"

RUN apt-get update

USER root

# install dev tools
RUN apt-get update
RUN apt install -y wget gnupg gnupg1 gnupg2 software-properties-common curl apt-utils
RUN wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -
RUN add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
RUN apt-get update
RUN apt-get install -y adoptopenjdk-8-hotspot
RUN apt install -y openssh-server openssh-client
ENV LANG en_US.utf8
ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0-openjdk.x86_64


RUN mkdir -p /root/.ssh/
CMD ["/bin/bash"," echo ssh-keygen -t rsa"]
CMD ["/bin/bash"," echo cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_key"]
CMD ["/bin/bash"," echo ssh localhost"]

# hadoop
RUN curl -s https://downloads.apache.org/hadoop/common/hadoop-2.10.1/hadoop-2.10.1.tar.gz | tar -xz -C /usr/local/
RUN cd /usr/local && ln -s ./hadoop-2.10.1 hadoop


ENV HADOOP_HOME /usr/local/hadoop
ENV PATH $PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin

RUN export JAVA_HOME=/usr/lib/jvm/adoptopenjdk-8-hotspot-amd64
RUN export HADOOP_HOME=/usr/local/hadoop
RUN export HADOOP_INSTALL=$HADOOP_HOME
RUN export HADOOP_MAPRED_HOME=$HADOOP_HOME
RUN export HADOOP_COMMON_HOME=$HADOOP_HOME
RUN export HADOOP_HDFS_HOME=$HADOOP_HOME
RUN export YARN_HOME=$HADOOP_HOME
RUN export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
RUN export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin
RUN export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native"


RUN mkdir $HADOOP_HOME/input
RUN cp $HADOOP_HOME/etc/hadoop/*.xml $HADOOP_HOME/input

## pseudo distributed
ADD /build/docker/hadoop/conf/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
RUN sed s/HOSTNAME/localhost/ /usr/local/hadoop/etc/hadoop/core-site.xml > /usr/local/hadoop/etc/hadoop/core-site.xml
ADD /build/docker/hadoop/conf/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml
#
ADD /build/docker/hadoop/conf/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml
ADD /build/docker/hadoop/conf/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml


#
ADD /build/docker/hadoop/conf/ssh_config /root/.ssh/config
RUN chmod 600 /root/.ssh/config
RUN chown root:root /root/.ssh/config

ADD /build/docker/hadoop/conf/bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

ENV BOOTSTRAP /etc/bootstrap.sh

RUN ls -la /usr/local/hadoop/etc/hadoop/*-env.sh
RUN chmod +x /usr/local/hadoop/etc/hadoop/*-env.sh
RUN ls -la /usr/local/hadoop/etc/hadoop/*-env.sh

CMD ["/bin/bash"," echo hdfs namenode -format"]

RUN service sshd start && $HADOOP_HOME/etc/hadoop/hadoop-env.sh && $HADOOP_HOME/sbin/start-dfs.sh && $HADOOP_HOME/bin/hdfs dfs -mkdir -p /user/root
RUN service sshd start && $HADOOP_HOME/etc/hadoop/hadoop-env.sh && $HADOOP_HOME/sbin/start-dfs.sh && $HADOOP_HOME/bin/hdfs dfs -put $HADOOP_HOME/etc/hadoop/ input

# Hdfs ports
EXPOSE 50010 50020 50070 50075 50090 8020 9000
# Mapred ports
EXPOSE 10020 19888
#Yarn ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088
#Other ports
EXPOSE 49707 2122