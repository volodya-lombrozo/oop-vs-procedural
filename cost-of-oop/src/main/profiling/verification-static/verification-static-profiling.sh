## Before specifying application jar path, you need to build the project.
## If you are in the directory of this script, you can run the following commands:
## cd ../../java/verification/statics/
## javac -d ./build *.java
## jar cfe verification-statics.jar verification.statics.StaticsOnly -C build .
export APPLICATION_JAR="../../java/verification/statics/verification-statics.jar"
../jar-profiling.sh