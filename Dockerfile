# Image de base légère avec Java 17 (comme ton pom.xml)
FROM openjdk:17-jdk-alpine

# Répertoire de travail dans le conteneur
WORKDIR /app

# Copie le JAR généré par Maven (adapte le nom si besoin)
COPY target/student-management-0.0.1-SNAPSHOT.jar app.jar

# Expose le port par défaut de Spring Boot
EXPOSE 8080

# Commande pour lancer l'app
ENTRYPOINT ["java", "-jar", "app.jar"]