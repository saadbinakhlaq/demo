FROM maven:3-openjdk-11 as maven
COPY ./pom.xml ./pom.xml
RUN mvn dependency:go-offline -B

COPY ./src ./src
RUN mvn package -DskipTests

FROM openjdk:11-jre-slim
WORKDIR /my-project

COPY --from=maven target/demo-0.0.1-SNAPSHOT.jar ./
CMD ["java", "-jar", "./demo-0.0.1-SNAPSHOT.jar"]
