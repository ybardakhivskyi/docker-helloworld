FROM ubuntu:trusty

# from http://dockerfile.github.io/#/java
RUN \
  apt-get update && \
  apt-get install -y openjdk-7-jdk && \
  rm -rf /var/lib/apt/lists/*

RUN useradd --create-home helloworld
ADD bin /home/helloworld/bin
ADD target/helloworld.war /home/helloworld/bin/helloworld.war
ADD target/dependency/jetty-runner.jar /home/helloworld/bin/jetty-runner.jar

EXPOSE 8080
USER helloworld

ENTRYPOINT /home/helloworld/bin/run.sh