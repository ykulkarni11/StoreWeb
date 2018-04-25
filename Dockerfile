# use a node base image
FROM ansible/centos7-ansible

# set maintainer
LABEL maintainer "Yogirajdk1993@gmail.com"

# Install prepare infrastructure
RUN yum -y update && \
 yum -y install wget && \
 yum -y install tar

# Prepare environment 
ENV JAVA_HOME /opt/java
ENV PATH $PATH:$JAVA_HOME/bin

# Install Oracle Java8
ENV JAVA_VERSION 8u162
ENV JAVA_BUILD 8u162-b12
ENV JAVA_DL_HASH 0da788060d494f5095bf8624735fa2f1 

RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jdk-8u171-linux-x64.tar.gz" && \
 tar -xvf jdk-8u171-linux-x64.tar.gz && \
 rm jdk*.tar.gz && \
 mv jdk* ${JAVA_HOME}
 
RUN curl -fsSL https://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
  
  ENV MAVEN_HOME /usr/share/maven

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1

# tell docker what port to expose
EXPOSE 8000
