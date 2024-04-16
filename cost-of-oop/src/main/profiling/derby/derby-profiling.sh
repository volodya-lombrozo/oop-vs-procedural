## Apache Derby
## This script is used to profile Apache Derby using YourKit Java Profiler.
## The application is started with the YourKit Java Profiler agent.
## Before running this script, you need to prepare environment as follows:
## 1. Download Apache Derby 10.16.1.1 from https://db.apache.org/derby/derby_downloads.html
## 2. Set the path to the Apache Derby jar in the APPLICATION_JAR variable in this script.
##    Usually it is the folder where you extracted Apache Derby: ".db-derby-10.16.1.1-bin/lib/derbyrun.jar"
## 3. Then, just run this script.

export JMETER_PLAN="Apache Derby.jmx"
export APPLICATION_JAR="./db-derby-10.16.1.1-bin/lib/derbyrun.jar server start"
../jar-profiling.sh