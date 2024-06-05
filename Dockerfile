# Use a specific Maven version with JDK 11
FROM maven:3.8.5-openjdk-11 AS build

# Copy application code to the build stage
COPY . .

# Build the application, skipping tests
RUN mvn clean package -DskipTests

# Switch to a slimmer runtime image
FROM openjdk:11.0.14-jdk-slim

# Set the working directory in the image
WORKDIR /app

# Copy the built JAR from the build stage to the image
COPY --from=build /target/used-cars-sales-portal-0.0.1-SNAPSHOT.jar /app/used-cars-sales-portal.jar

# Expose port 8080 for the Spring Boot application
EXPOSE 8080

# Start the Spring Boot application
CMD ["java", "-jar", "used-cars-sales-portal.jar"]
