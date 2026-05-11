#FROM openjdk:8-jdk-alpine
#FROM eclipse-temurin:25-jdk-alpine
#ENV APP_FILE maid-account-manager-0.1.0.jar
#ENV APP_HOME /usr/app
#COPY target/$APP_FILE $APP_HOME/
#WORKDIR $APP_HOME
#ENTRYPOINT ["sh", "-c"]
#CMD ["exec java -jar $APP_FILE"]
FROM maven:3.9-eclipse-temurin-25 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests
FROM eclipse-temurin:25-jre-alpine
WORKDIR /usr/app
COPY --from=build /app/target/maid-account-manager-0.1.0.jar app.jar
EXPOSE 8080
CMD ["sh", "-c", "java -Dserver.port=${PORT:-8080} -jar app.jar"]
