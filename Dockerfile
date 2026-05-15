FROM maven:3.9.15-eclipse-temurin-17-alpine AS build
ADD . /myjar
WORKDIR /myjar
RUN mvn package
FROM eclipse-temurin:17.0.19_10-jre-ubi9-minimal AS runtime
COPY --from=build /myjar/target/*.jar myjarapp.jar
EXPOSE 8080
CMD ["java", "-jar", "myjarapp.jar"]