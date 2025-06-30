FROM maven:3.8.6-openjdk-8 AS builder

WORKDIR /build
COPY pom.xml .
COPY WebContent ./WebContent

RUN mvn dependency:go-offline

COPY src ./src

RUN mvn clean install -DskipTests

FROM tomcat:9.0-jre8

WORKDIR /usr/local/tomcat/webapps

COPY --from=builder /build/target/App42PaaS-Java-MySQL-Sample-*.war /usr/local/tomcat/webapps

EXPOSE 8080

