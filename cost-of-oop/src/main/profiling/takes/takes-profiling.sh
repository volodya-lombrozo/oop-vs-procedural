export JMETER_PLAN="Takes.jmx"
PROFILER_AGENT="/Applications/YourKit-Java-Profiler-2022.9.app/Contents/Resources/bin/mac/libyjpagent.dylib"
export APPLICATION_STARTUP="java -agentpath:$PROFILER_AGENT=_instrument_all_methods -Dfile.encoding=UTF-8 -jar /Users/lombrozo/Workspace/OpenSource/takes-example/target/takes-example-0.1.0-jar-with-dependencies.jar"
../jar-profiling.sh