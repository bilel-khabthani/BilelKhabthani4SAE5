# Stage 1 : Build (compilation avec Maven)
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
# Compile le projet (skip tests pour accélérer)
RUN mvn clean package -DskipTests

# Stage 2 : Runtime (image légère avec le JAR)
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
# Copie le JAR depuis le stage de build
COPY --from=build /app/target/*.jar app.jar
# Expose le port par défaut de Spring Boot
EXPOSE 8080
# Lance l'app
ENTRYPOINT ["java", "-jar", "app.jar"]