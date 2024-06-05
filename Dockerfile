# Use a specific Maven version with JDK 11
FROM maven:3.8.5-openjdk-11 AS build

# Copy application code to the build stage
COPY . .

# Build the application, skipping tests
RUN mvn clean package -DskipTests

# Switch to a slimmer runtime image
FROM tomcat:9.0.57-jdk11-openjdk-slim

# Remove the default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built JAR from the build stage to the Tomcat webapps directory
COPY --from=build /target/used-cars-sales-portal-0.0.1-SNAPSHOT.jar /usr/local/tomcat/webapps/used-cars-sales-portal.jar

# Expose port for the application
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
