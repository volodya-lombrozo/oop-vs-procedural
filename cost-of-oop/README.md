# Method profiling results

Profiling results for 28 Java frameworks used across 10 applications. This
module includes all scripts utilized for profiling each application,
encompassing program startup procedures, profiler initialization, result
exports, and testing scripts, such as those used for
the [Apache JMeter](https://jmeter.apache.org) application.

This repository contains the profiling results for the following applications:

- [derby](src/main/profiling/derby/method-list-cpu.csv)
- [dropwizard](src/main/profiling/dropwizard/method-list-cpu.csv)
- [h2](src/main/profiling/h2/method-list-cpu.csv)
- [kafka](src/main/profiling/kafka/method-list-cpu.csv)
- [micronaut](src/main/profiling/micronaut/method-list-cpu.csv)
- [spring-mvc](src/main/profiling/spring-mvc/method-list-cpu.csv)
- [struts2](src/main/profiling/struts/method-list-cpu.csv)
- [takes](src/main/profiling/takes/method-list-cpu.csv)
- [tomcat](src/main/profiling/tomcat/method-list-cpu.csv)
- [vertx](src/main/profiling/vertx/method-list-cpu.csv)

Each CSV file contains a list of methods along with the number of invocations
and the CPU time spent in each method.

All of these applications were profiled over one minute under a constant load of
20-50 requests per second. Generally, the profiling pipeline is as follows:

- Start the application with
  profiler [bytecode instrumentation](https://www.yourkit.com/docs/java-profiler/2023.5/help/agent.jsp)
  by using `-agentpath` option.
- Start the load generator ([Apache JMeter](https://jmeter.apache.org)) with
  predefined test case.
- Initiate profiling
- Wait for a minute
- Stop profiling
- Stop the load generator
- Stop the application
- Save the profiling results

You can find all the profiling scripts in
the [profiling](src/main/profiling) folder for each
application. For example, the Micronaut profiling script is located in the
[main/profiling/micronaut](src/main/profiling/micronaut) folder:

[micronaut-profiling.sh](src%2Fmain%2Fprofiling%2Fmicronaut%2Fmicronaut-profiling.sh) -
script for starting the entire profiling pipeline.
[Micronaut.jmx](src%2Fmain%2Fprofiling%2Fmicronaut%2FMicronaut.jmx) - JMeter
test case for the Micronaut application.
[method-list-cpu.csv](src%2Fmain%2Fprofiling%2Fmicronaut%2Fmethod-list-cpu.csv) -
profiling results. List of methods with the number of invocations and the CPU
time spent in each method.

All other applications follow the same structure. Each startup script includes
comments on how to run the application:

- [derby.sh](src/main/profiling/derby/derby-profiling.sh) - run the derby
  profiling pipeline.
- [dopwizard.sh](src/main/profiling/dropwizard/dropwizard-profiling.sh) - run
  the dropwizard profiling pipeline.
- [h2.sh](src/main/profiling/h2/h2-profiling.sh) - run the h2 profiling
  pipeline.
- [kafka.sh](src/main/profiling/kafka/kafka-profiling.sh) - run the kafka
  profiling pipeline.
- [micronaut.sh](src/main/profiling/micronaut/micronaut-profiling.sh) - run the
  micronaut profiling pipeline.
- [spring-profiling.sh](src/main/profiling/spring-mvc/spring-profiling.sh) - run
  the spring-mvc profiling pipeline.
- [struts.sh](src/main/profiling/struts/struts-profiling.sh) - run the struts2
  profiling pipeline.
- [takes.sh](src/main/profiling/takes/takes-profiling.sh) - run the takes
  profiling pipeline.
- [tomcat.sh](src/main/profiling/tomcat/tomcat-profiling.sh) - run the tomcat
  profiling pipeline.
- [vertx.sh](src/main/profiling/vertx/vertx-profiling.sh) - run the vertx
  profiling pipeline.

We also have three additional scripts to check our verification process:

- [verification-static.sh](src/main/profiling/verification-static/verification-static-profiling.sh) -
  run a profiling pipeline of an application that contains only static methods.
- [verification-instance.sh](src/main/profiling/verification-instance/verification-instance-profiling.sh) -
  run a profiling pipeline of an application that contains only instance method
  invocations.
- [verification-half.sh](src/main/profiling/verification-half/verification-half-profiling.sh) -
  run a profiling pipeline of an application that contains 50% static and 50%
  instance method invocations.

**Note:** before starting the profiling pipeline you need:

1. Download and
   install [YourKit Java Profiler](https://www.yourkit.com/java/profiler/download/).
2. Download and
   install [Apache JMeter](https://jmeter.apache.org/download_jmeter.cgi).
3. Download and install the application you want to profile.
4. Change paths in the scripts according to your environment.

## Results

// todo exclusions like h2

// aggregated results in [results](results/.)

## Ancestor

This submodule was originally a standalone repository is still
available [here](https://github.com/volodya-lombrozo/cost-of-oop).