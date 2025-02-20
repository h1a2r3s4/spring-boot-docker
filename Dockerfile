FROM openjdk:17-jdk-alpine
COPY target/spring-boot-docker-0.0.1-SNAPSHOT.jar app.jar
CMD ["java","-jar","/app.jar"]
