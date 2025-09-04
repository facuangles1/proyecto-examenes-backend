# Etapa 1: Build con Maven y JDK 8
FROM maven:3.9.9-amazoncorretto-8 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Etapa 2: Runtime con Corretto 8 (más liviano)
FROM amazoncorretto:8-alpine-jdk
WORKDIR /app
COPY --from=build /app/target/*.jar app-backend.jar
ENTRYPOINT ["java", "-jar", "app-backend.jar"]
