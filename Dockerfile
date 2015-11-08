FROM ubuntu:14.04

ADD cloudera.list /etc/apt/sources.list.d/cloudera.list
ADD archive.key /root/cloudera.key

RUN apt-key add /root/cloudera.key && \
  apt-get update && \
  apt-get install -y hadoop hadoop-hdfs-namenode hadoop-hdfs-secondarynamenode hadoop-hdfs-datanode hadoop-hdfs-nfs3 nfs-common

ADD core-site.xml /etc/hadoop/conf/core-site.xml
ADD start-hdfs /usr/local/sbin/start-hdfs

VOLUME /tmp /etc/hadoop/conf

EXPOSE 111 2049 4242 9000 50010 50020 50070 50075 50090

CMD start-hdfs
