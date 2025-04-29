FROM eclipse-temurin:17-jdk

# Set working directory
WORKDIR /app

# Copy your Java source file into the container
COPY ./test.java /app/test.java

# Compile the Java file
RUN javac -d out test.java

# Package it into a JAR
RUN jar cfe app.jar test -C out .

# Expose a port (optional)
EXPOSE 8080

# Run the JAR file
ENTRYPOINT ["java", "-jar", "app.jar"]
