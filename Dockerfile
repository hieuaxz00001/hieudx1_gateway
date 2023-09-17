FROM openjdk:17-oracle
LABEL maintainer="author@hieudx.com"
EXPOSE 8081
ENTRYPOINT ["java","-Dspring.profiles.active=dev","-jar","/target/*.jar"]

#FROM maven:3.9.3 AS build
#WORKDIR /home/app/
#COPY src /home/app/src
#COPY pom.xml /home/app
#RUN mvn clean install
#
#FROM openjdk:17-oracle
#LABEL maintainer="author@hieudx.com"
#EXPOSE 8761
#COPY --from=build /home/app/target/registry.jar registry.jar
#ENTRYPOINT ["java","-Dspring.profiles.active=dev","-jar","/registry.jar"]