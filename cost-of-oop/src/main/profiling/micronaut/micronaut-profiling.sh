## Micronaut
## This script is used to profile the Micronaut application using JMeter and YourKit.
## The application is started with the YourKit Java Profiler agent.
## Before running this script, you need to prepare environment as follows:
## 1. Build the micronaut-example project. See micronaut-example/README.md for details.
## 2. Set the path to the application jar in the APPLICATION_JAR variable. Most probably it will be './micronaut-example/target/demo-0.1.jar'

export JMETER_PLAN="Micronaut.jmx"
export APPLICATION_JAR="./micronaut-example/target/demo-0.1.jar"
../jar-profiling.sh