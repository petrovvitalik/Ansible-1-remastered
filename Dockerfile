FROM maven:alpine as maven
RUN apk update && apk add git
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd /boxfuse-sample-java-war-hello && mvn package

FROM tomcat:latest
COPY --from=maven /boxfuse-sample-java-war-hello/target/ /usr/local/tomcat/webapps