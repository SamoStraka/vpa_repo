# Use the official Maven image as the base image
FROM maven:3.8.2-openjdk-17 as build

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml file to download dependencies
COPY pom.xml .

# Copy the rest of your app's source code
COPY src ./src

# Build the project
RUN mvn clean package

# Use the OpenJDK image to run the app
FROM openjdk:19-jdk-alpine

# Set the working directory in the Docker container
WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port that the application will run on
EXPOSE 8080

# Start the application
ENTRYPOINT ["java", "-jar", "app.jar"]
