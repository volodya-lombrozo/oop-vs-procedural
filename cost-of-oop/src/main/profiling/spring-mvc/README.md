## Spring REST Service Profiling

To profile a Spring-based application, we used the official Spring guide
[Building a RESTful Web Service](https://spring.io/guides/gs/rest-service).
It contains all the required components to build an application that mimics the
real behavior of a standard Spring-based application.

You can find the original
code [here](https://github.com/spring-guides/gs-rest-service).

## Building the Project with Maven

First of all, to download the project, run the following command:

```shell
git clone git@github.com:spring-guides/gs-rest-service.git
```

then go to the project directory:

```shell
cd gs-rest-service/complete
```

And run the following command:

```shell
./mvnw clean package
```

in the `complete/target` directory you will find
the `rest-service-complete-0.0.1-SNAPSHOT.jar`
file that you might use to run a profiling pipeline.