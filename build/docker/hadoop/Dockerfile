FROM cploutarchou/centos6.10-pam:latest

LABEL maintainer="Christos Ploutarchou<cploutarchou@gmail.com>"

ARG build_date=date+"%Y-%m-%d %T"

LABEL org.label-schema.build-date=${build_date}
LABEL org.label-schema.name="Spark Cluster on Docker - Spark Master Image"
LABEL org.label-schema.description="Spark master image"
LABEL org.label-schema.url="https://github.com/cploutarchou/pyspark-cluster-with-hadoop-on-docker"
LABEL org.label-schema.schema-version="1.0"


USER root

# install dev tools
RUN yum clean all; \
    rpm --rebuilddb; \
    yum install -y curl which tar sudo openssh-server openssh-clients rsync java-1.8.0-openjdk java-1.8.0-openjdk-devel
RUN yum update -y libselinux

# passwordless ssh
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa
RUN cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0-openjdk.x86_64

# download native support
RUN mkdir -p /tmp/native
RUN curl -L https://github.com/cploutarchou/native-hadoop-library/archive/v1.0.tar.gz | tar -xz -C /tmp/native

# hadoop
RUN curl -s https://downloads.apache.org/hadoop/common/hadoop-2.10.1/hadoop-2.10.1.tar.gz | tar -xz -C /usr/local/
RUN cd /usr/local && ln -s ./hadoop-2.10.1 hadoop

ENV HADOOP_HOME /usr/local/hadoop
ENV HADOOP_INSTALL $HADOOP_HOME
ENV HADOOP_MAPRED_HOME $HADOOP_HOME
ENV HADOOP_COMMON_HOME $HADOOP_HOME
ENV HADOOP_HDFS_HOME $HADOOP_HOME
ENV YARN_HOME $HADOOP_HOME


RUN sed -i '/^export JAVA_HOME/ s:.*:export JAVA_HOME=/usr/java/default\nexport HADOOP_PREFIX=/usr/local/hadoop\nexport HADOOP_HOME=/usr/local/hadoop\n:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh
RUN sed -i '/^export HADOOP_CONF_DIR/ s:.*:export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop/:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh


RUN mkdir $HADOOP_PREFIX/input
RUN cp $HADOOP_PREFIX/etc/hadoop/*.xml $HADOOP_PREFIX/input

# pseudo distributed
ADD /build/docker/hadoop/conf/core-site.xml $HADOOP_PREFIX/etc/hadoop/core-site.xml
RUN sed s/HOSTNAME/localhost/ /usr/local/hadoop/etc/hadoop/core-site.xml > /usr/local/hadoop/etc/hadoop/core-site.xml
ADD /build/docker/hadoop/conf/hdfs-site.xml $HADOOP_PREFIX/etc/hadoop/hdfs-site.xml

ADD /build/docker/hadoop/conf/mapred-site.xml $HADOOP_PREFIX/etc/hadoop/mapred-site.xml
ADD /build/docker/hadoop/conf/yarn-site.xml $HADOOP_PREFIX/etc/hadoop/yarn-site.xml

RUN $HADOOP_PREFIX/bin/hdfs namenode -format


RUN rm -rf /usr/local/hadoop/lib/native
RUN mv /tmp/native /usr/local/hadoop/lib

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



# fix the 254 error code
RUN sed  -i "/^[^#]*UsePAM/ s/.*/#&/"  /etc/ssh/sshd_config
RUN echo "UsePAM no" >> /etc/ssh/sshd_config
RUN echo "Port 2122" >> /etc/ssh/sshd_config

RUN service sshd start && $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh && $HADOOP_PREFIX/sbin/start-dfs.sh && $HADOOP_PREFIX/bin/hdfs dfs -mkdir -p /user/root
RUN service sshd start && $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh && $HADOOP_PREFIX/sbin/start-dfs.sh && $HADOOP_PREFIX/bin/hdfs dfs -put $HADOOP_PREFIX/etc/hadoop/ input

CMD ["/etc/bootstrap.sh", "-d"]

# Hdfs ports
EXPOSE 50010 50020 50070 50075 50090 8020 9000
# Mapred ports
EXPOSE 10020 19888
#Yarn ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088
#Other ports
EXPOSE 49707 2122