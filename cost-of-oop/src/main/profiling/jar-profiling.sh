set -x
set -e
#Init all required variables
JMETER_PLAN=${JMETER_PLAN:="Apache Derby.jmx"}
JMETER_PATH=${JMETER_PATH:="/Users/lombrozo/Workspace/Tools/apache-jmeter-5.5/bin"}
PROFILER=${PROFILER:="/Applications/YourKit-Java-Profiler-2022.9.app/Contents/Resources"}
APPLICATION_JAR=${APPLICATION_JAR:="/Users/lombrozo/Workspace/Tools/db-derby-10.16.1.1-bin/lib/derbyrun.jar server start"}
PROFILER_SNAPSHOTS=${PROFILER_SNAPSHOTS:="/Users/lombrozo/Snapshots"}
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