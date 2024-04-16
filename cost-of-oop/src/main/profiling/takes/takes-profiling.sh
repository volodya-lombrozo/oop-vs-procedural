## This script is used to profile the Takes example application.
## The application is started with the YourKit Java Profiler agent.
## Specify the path to the profiler agent in the PROFILER_AGENT variable.
## Specify the path to the application startup command in the APPLICATION_STARTUP variable.
## ! Before running this script, you need to build the project. See ./takes-example/README.md for details. !
export JMETER_PLAN="Takes.jmx"
PROFILER_AGENT="/Applications/YourKit-Java-Profiler-2022.9.app/Contents/Resources/bin/mac/libyjpagent.dylib"
export APPLICATION_STARTUP="java -agentpath:$PROFILER_AGENT=_instrument_all_methods -Dfile.encoding=UTF-8 -jar ./takes-example/target/takes-example-0.1.0-jar-with-dependencies.jar"
../jar-profiling.sh