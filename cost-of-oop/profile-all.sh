set -x
set -e
PROFILER=/Applications/YourKit-Java-Profiler-2022.9.app/Contents/Resources/lib/yjp-controller-api-redist.jar
SNAPSHOTS=/Users/lombrozo/Snapshots
java -jar $PROFILER status

java -jar $PROFILER clear-cpu-data
java -jar $PROFILER clear-alloc-data
java -jar $PROFILER clear-monitor-data
java -jar $PROFILER clear-charts

java -jar $PROFILER start-alloc-object-counting
java -jar $PROFILER start-tracing
echo "Profiling is started successfully"
sleep 60
java -jar $PROFILER capture-performance-snapshot
java -jar $PROFILER capture-memory-snapshot
java -jar $PROFILER stop-alloc-recording
java -jar $PROFILER stop-cpu-profiling
ls -Artlh $SNAPSHOTS | tail -n 2
echo  "Profiling is stopped successfully"