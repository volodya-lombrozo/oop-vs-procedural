## Kafka
## This script is used to profile Apache Kafka using YourKit Java Profiler.
## Before running this script, you need to prepare environment as follows:
## 1. Download Apache Kafka 3.4.0 from https://kafka.apache.org/downloads
## 2. Set the path to the Kafka home in the KAFKA_PATH variable in this script. Usually it is the folder where you extracted Kafka: "./apache-kafka"
## 3. Set the path to the YourKit Java Profiler agent in the PROFILER_AGENT variable in this script. Usually it is the folder where you installed YourKit: "/Applications/YourKit-Java-Profiler-2022.9.app/Contents/Resources/bin/mac/libyjpagent.dylib"
## 4. Then, just run this script.
export JMETER_PLAN="Apache-Kafka.jmx"
export KAFKA_PATH=./apache-kafka
$KAFKA_PATH/bin/zookeeper-server-start.sh $KAFKA_PATH/config/zookeeper.properties &
sleep 10
export PROFILER_AGENT="/Applications/YourKit-Java-Profiler-2022.9.app/Contents/Resources/bin/mac/libyjpagent.dylib"
export KAFKA_OPTS="-agentpath:$PROFILER_AGENT=_instrument_all_methods"
export APPLICATION_STARTUP="$KAFKA_PATH/bin/kafka-server-start.sh $KAFKA_PATH/config/server.properties"
../jar-profiling.sh
$KAFKA_PATH/bin/kafka-server-stop.sh
$KAFKA_PATH/bin/zookeeper-server-stop.sh