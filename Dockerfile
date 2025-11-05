FROM tomcat:9.0.68-jre11

# Copy the WAR file to Tomcat webapps directory
COPY pom.xml /app/pom.xml
COPY src /app/src

# Install Maven
RUN apt-get update && apt-get install -y maven

# Build the application
WORKDIR /app
RUN mvn clean package -DskipTests

# Copy the built WAR to Tomcat
RUN cp /app/target/ResumeBuilder-1.0.war /usr/local/tomcat/webapps/ResumeBuilder.war

# Expose port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
