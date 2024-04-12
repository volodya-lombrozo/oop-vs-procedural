# Method profiling results

Profiling results of 28 Java frameworks used in 10 applications. This module
contains all scripts used for profiling each application. This includes the
program startup procedures, the initialization of the profiler, result exports,
and testing scripts such as those for [Apache JMeter](https://jmeter.apache.org)
application.

This repository contains the profiling results of the following applications:

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

Each CSV file contains a list of methods with the number of invocations and CPU
time spent in the methods.

All of that applications were profiled during one minute with a constant load
of 20-50 requests per second. In general, a profiling pipeline is following:

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

You can find all profiling scripts under `main/profiling` folder for each
application.
For example, Micronaut profiling script is located
under `main/profiling/micronaut` folder:

- `micronaut-profilinf.sh` - script for starting the entire profiling pipeline.
- `Micronaut.jmx` - JMeter test case for Micronaut application.
- `method-list-cpu.csv` - list of methods with the number of invocations and CPU
  time spent in the methods.

All other applications have the same structure.

**Note:** before starting the profiling pipeline you need:

1. Download and
   install [YourKit Java Profiler](https://www.yourkit.com/java/profiler/download/).
2. Download and
   install [Apache JMeter](https://jmeter.apache.org/download_jmeter.cgi).
3. Download and install the application you want to profile.
4. Change paths in the scripts according to your environment.

## Ancestor

This submodule was originally a standalone repository is still
available [here](https://github.com/volodya-lombrozo/cost-of-oop).