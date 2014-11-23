FROM ubuntu:14.04

ADD cloudera.list /etc/apt/sources.list.d/
ADD archive.key /root/cloudera.key
RUN apt-key add /root/cloudera.key

RUN apt-get update
RUN apt-get install -y hadoop
RUN apt-get install -y hadoop-hdfs-namenode
RUN apt-get install -y hadoop-hdfs-secondarynamenode
RUN apt-get install -y hadoop-hdfs-datanode
RUN apt-get install -y hadoop-hdfs-nfs3
RUN apt-get install -y nfs-common

ADD core-site.xml /etc/hadoop/conf/
ADD start-hdfs /usr/local/sbin/

VOLUME /tmp
VOLUME /etc/hadoop/conf

EXPOSE 111
EXPOSE 2049
EXPOSE 4242
EXPOSE 9000
EXPOSE 50010
EXPOSE 50020
EXPOSE 50070
EXPOSE 50075
EXPOSE 50090

CMD ["start-hdfs"]

