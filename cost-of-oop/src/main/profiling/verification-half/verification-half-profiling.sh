## Before specifying application jar path, you need to build the project.
## If you are in the directory of this script, you can run the following commands:
## cd ../../java/verification/half/
## javac -d ./build *.java
## jar cfe verification-half.jar verification.half.Half -C build .
export APPLICATION_JAR="../../java/verification/half/verification-half.jar"
../jar-profiling.sh