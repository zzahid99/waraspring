FROM openjdk:11
ARG PORT=8080
ARG APPLICATION_VERSION="0.1.0-SNAPSHOT"
ARG SERVICE_NAME="spring-boot-api-example"


ENV APPLICATION_VERSION ${APPLICATION_VERSION}

COPY build/libs/${SERVICE_NAME}-${APPLICATION_VERSION}.jar .
ENV SERVICE_PATH=/${SERVICE_NAME}-${APPLICATION_VERSION}.jar

EXPOSE ${PORT}
ENTRYPOINT ["sh","-c","java -jar ${SERVICE_PATH}"]
