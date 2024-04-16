## Dropwizard
## This script is used to profile the Dropwizard application using JMeter and YourKit.
## The application is started with the YourKit Java Profiler agent.
## Before running this script, you need to prepare environment as follows:
## 1. Build the dropwizard-example project. See dropwizard-example/README.md for details.
## 2. Set the path to the application jar in the APPLICATION_JAR variable. Most probably it will be './dropwizard-example/target/dropwizard-1.0-SNAPSHOT.jar'
## 3. Then, just run this script.

export JMETER_PLAN="Dropwizard.jmx"
export APPLICATION_JAR="./dropwizard-example/target/dropwizard-1.0-SNAPSHOT.jar server"
../jar-profiling.sh