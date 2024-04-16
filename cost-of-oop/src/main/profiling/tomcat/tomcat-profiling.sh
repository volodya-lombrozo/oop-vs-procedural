## To profile Tomcat, you need to perform the following steps:
## 1. Install Apache Tomcat 10.1.8 https://tomcat.apache.org/download-10.cgi
## 2. Set profiling agent to catalina.sh: PROFILER_AGENT="/Applications/YourKit-Java-Profiler-2022.9.app/Contents/Resources/bin/mac/libyjpagent.dylib"
## (path to the catalina.sh usually is apache-tomcat-10.1.8/bin/catalina.sh)
## Then don't forget to specify APPLICATION_STARTUP="./apache-tomcat-10.1.8/bin/startup.sh" - to the folder where you installed Apache Tomcat.
export JMETER_PLAN="Apache-Tomcat.jmx"
export APPLICATION_STARTUP="./apache-tomcat-10.1.8/bin/startup.sh"
../jar-profiling.sh