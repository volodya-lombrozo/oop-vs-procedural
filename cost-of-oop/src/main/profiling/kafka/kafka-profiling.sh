export JMETER_PLAN="Apache-Kafka.jmx"
export KAFKA_PATH=/Users/lombrozo/Workspace/Tools/apache-kafka
$KAFKA_PATH/bin/zookeeper-server-start.sh $KAFKA_PATH/config/zookeeper.properties &
sleep 10
export PROFILER_AGENT="/Applications/YourKit-Java-Profiler-2022.9.app/Contents/Resources/bin/mac/libyjpagent.dylib"
export KAFKA_OPTS="-agentpath:$PROFILER_AGENT=_instrument_all_methods"
export APPLICATION_STARTUP="$KAFKA_PATH/bin/kafka-server-start.sh $KAFKA_PATH/config/server.properties"
../jar-profiling.sh
$KAFKA_PATH/bin/kafka-server-stop.sh
$KAFKA_PATH/bin/zookeeper-server-stop.sh