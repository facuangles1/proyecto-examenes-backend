FROM amazoncorretto:8-alpine-jdk

WORKDIR /app
COPY target/target/sistema-examenes-backend-0.0.1-SNAPSHOT.jar  app-backend.jar
ENTRYPOINT ["java", "-jar", "app-backend.jar"]

