## H2
## This script is used to profile the H2 database.
## The application is started with the YourKit Java Profiler agent.
## Before running this script, you need to prepare environment as follows:
## 1. Download H2 2.1.214 from https://h2database.com/html/download.html
## 2. Set the path to the H2 jar in the APPLICATION_JAR variable in this script. Usually it is the folder where you extracted H2: "./h2/bin/h2-2.1.214.jar"
## 3. Then, just run this script.

export JMETER_PLAN="H2.jmx"
export APPLICATION_JAR="./h2/bin/h2-2.1.214.jar"
../jar-profiling.sh