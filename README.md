## Project title
Spring Boot java API + Postgres

## Motivation
A single resource API to demonstrate how to package a JAVA app with docker

## Installation

##### Step 1

Create a network

```
  $ docker network create --driver bridge java_app_network
```

##### Step 2

Run postgres in this network
```
  docker run --net=java_app_network -p 5432:5432 \
             -e POSTGRES_PASSWORD=docker \
             -e POSTGRES_USER=docker \
             -e POSTGRES_DB=docker \
             --name postgres postgres:9.5-alpine
```

##### Step 3

Build Demo Spring boot project

```
  $ docker build -t spring_starter .
```

##### Step 4

Run the container in the `java_app_network` network

```
  $ docker run --net=java_app_network -p 8080:8080 spring_starter
```

## API Reference
```
GET http://localhost:8080/api/v1/employees

POST http://localhost:8080/api/v1/employees
body_params { "name": "Alex", "age": 22 }

GET http://localhost:8080/api/v1/employees/1

DELETE http://localhost:8080/api/v1/employees/1
```

## How to use?

A [postman collection](docker_java_demo.postman_collection.json) has been added


### Reference Documentation
For further reference, please consider the following sections:

* [Official Apache Maven documentation](https://maven.apache.org/guides/index.html)
* [Spring Boot Maven Plugin Reference Guide](https://docs.spring.io/spring-boot/docs/2.3.4.RELEASE/maven-plugin/reference/html/)
* [Create an OCI image](https://docs.spring.io/spring-boot/docs/2.3.4.RELEASE/maven-plugin/reference/html/#build-image)