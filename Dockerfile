# Sử dụng image JDK 17 chính thức làm base
FROM maven:3.8.4-openjdk-17 as build

COPY src /cuong/spring-mvc/src
COPY pom.xml /cuong/spring-mvc

WORKDIR /cuong/spring-mvc

RUN mvn clean package -DskipTests

FROM openjdk:17-slim

COPY --from=build /cuong/spring-mvc/target/*.war /cuong/spring-mvc/app.war

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/cuong/spring-mvc/app.war"]