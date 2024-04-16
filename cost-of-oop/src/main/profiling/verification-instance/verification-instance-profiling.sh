## Before specifying application jar path, you need to build the project.
## If you are in the directory of this script, you can run the following commands:
## cd ../../java/verification/instances/
## javac -d ./build *.java
## jar cfe verification-instances.jar verification.instances.InstanceOnly -C build .
export APPLICATION_JAR="../../java/verification/instances/verification-instances.jar"
../jar-profiling.sh