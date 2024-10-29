FROM openjdk:17-oracle
COPY ./target/bookgateway-0.0.1-SNAPSHOT.jar bookgateway.jar
CMD ["java","-jar","bookgateway.jar"]
