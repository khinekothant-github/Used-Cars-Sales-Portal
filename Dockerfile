# Use a Maven image as base to build the project
FROM maven:3.8.4-openjdk-11-slim AS build
WORKDIR /app
COPY pom.xml .
# Fetch dependencies
RUN mvn dependency:go-offline
COPY src src
# Build the project
RUN mvn clean package -DskipTests

# Use AdoptOpenJDK as base image for runtime
FROM adoptopenjdk/openjdk11:alpine-slim
WORKDIR /app
# Copy the generated WAR file from the build stage
COPY --from=build /app/target/used-cars-sales-portal-0.0.1-SNAPSHOT.war /app/used-cars-sales-portal.war
EXPOSE 8080
CMD ["java", "-jar", "/app/used-cars-sales-portal.war"]
