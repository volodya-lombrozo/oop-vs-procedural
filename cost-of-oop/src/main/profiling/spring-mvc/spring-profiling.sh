## Spring-MVC
## This script is used to profile the Spring-MVC application using JMeter and YourKit
## The application is started with the YourKit Java Profiler agent.
## Before running this script, you need to prepare environment as follows:
## 1. Build the gs-rest-service project. See README.md for details.
## 2. Set the path to the application jar in the APPLICATION_JAR variable. Most probably it will be './gs-rest-service/complete/target/rest-service-complete-0.0.1-SNAPSHOT.jar'
## 3. Then, just run this script.
export JMETER_PLAN="Spring-MVC.jmx"
export APPLICATION_JAR="./gs-rest-service/complete/target/rest-service-complete-0.0.1-SNAPSHOT.jar"
../jar-profiling.sh