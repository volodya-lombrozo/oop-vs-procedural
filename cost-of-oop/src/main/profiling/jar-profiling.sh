## This script is used to profile a Java application with JMeter and YourKit Java Profiler
## All the applications are started with the YourKit Java Profiler agent.
## Before running all scripts in this folder, you need to prepare this script as follows:
## 1. Set the path to the JMeter bin directory in the JMETER_PATH variable in this script.
## 2. Set the path to the YourKit Java Profiler directory in the PROFILER variable in this script.
set -x
set -e
#Init all required variables

# JMETER_PATH=${JMETER_PATH:="./apache-jmeter-5.5/bin"}
if [ -z "${JMETER_PATH}" ]; then
  echo "Error: JMETER_PATH is not set."
  exit 1
fi
# PROFILER=${PROFILER:="/Applications/YourKit-Java-Profiler-2022.9.app/Contents/Resources"}
if [ -z "${PROFILER}" ]; then
  echo "Error: PROFILER is not set."
  exit 1
fi

#APPLICATION_JAR=${APPLICATION_JAR:="./db-derby-10.16.1.1-bin/lib/derbyrun.jar server start"}
if [ -z "${APPLICATION_JAR}" ]; then
  echo "Error: APPLICATION_JAR is not set."
  exit 1
fi

PROFILER_SNAPSHOTS=${PROFILER_SNAPSHOTS:="$HOME/Snapshots"}
JMETER_PLAN=${JMETER_PLAN:="Apache Derby.jmx"}
PROFILER_API="$PROFILER/lib/yjp-controller-api-redist.jar"
PROFILER_AGENT="$PROFILER/bin/mac/libyjpagent.dylib"
PROFILER_CONVERTER="$PROFILER/lib/yourkit.jar"
APPLICATION_STARTUP=${APPLICATION_STARTUP:="java -agentpath:$PROFILER_AGENT=_instrument_all_methods -jar $APPLICATION_JAR"}
# In order to attach java agent use the next command for Mac
# -agentpath:<profiler directory>/bin/mac/libyjpagent.dylib
# To check commands for other OSs, please, visit https://www.yourkit.com/docs/java/help/agent.jsp
# In my case <profiler directory> is /Applications/YourKit-Java-Profiler-2022.9.app/Contents/Resources/bin/mac/libyjpagent.dylib
#Start application
$APPLICATION_STARTUP > /dev/null &
APP_PID=$!
echo "Java application pid=$APP_PID"
# Wait until startup
sleep 10
# Add load through JMeter
# The full documentation about JMeter cli you can find right here:
# https://jmeter.apache.org/usermanual/get-started.html#non_gui
if [[ -z "${JMETER_PLAN}" ]];
  then
    echo "JMeter plan is not set"
  else
    $JMETER_PATH/jmeter -n -t "$JMETER_PLAN" &
    JMETER_PID=$!
    echo "JMeter pid=$JMETER_PID"
fi
# Warmup
sleep 5
#Profile an application
java -jar $PROFILER_API status
java -jar $PROFILER_API clear-cpu-data
java -jar $PROFILER_API clear-alloc-data
java -jar $PROFILER_API clear-monitor-data
java -jar $PROFILER_API clear-charts
java -jar $PROFILER_API start-tracing
echo "Profiling is started successfully"
sleep 60
java -jar $PROFILER_API capture-performance-snapshot
java -jar $PROFILER_API stop-cpu-profiling
echo  "Profiling is stopped successfully"
#Convert results
#Find latest snapshot
SNAPSHOT_FILE=$(find "$PROFILER_SNAPSHOTS" -type f -exec stat -f '%m %R' {} + | sort -n | tail -1 | awk '{print $2}')
#Convert snapshot to csv
java -jar -Dexport.method.list.cpu -Dexport.csv "$PROFILER_CONVERTER" -export "$SNAPSHOT_FILE" .
#Stop load testing
$JMETER_PATH/stoptest.sh
if [[ -z "${JMETER_PID}" ]];
  then
    echo "JMeter is not running"
  else
    if ps -p $JMETER_PID > /dev/null
    then
       echo "$JMETER_PID is running"
       kill "$JMETER_PID"
    else
       echo "JMeter - $JMETER_PID is not running"
    fi
fi
#Stop application
if [[ -z "${APP_PID}" ]];
  then
    echo "Application is not running"
  else
    kill "$APP_PID"
fi
mv "Method-list--CPU.csv" "method-list-cpu.csv"