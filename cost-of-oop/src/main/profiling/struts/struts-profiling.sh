## This script is used to profile the Struts application using JMeter and YourKit
## The application is started with the YourKit Java Profiler agent.
## Before running this script, you need to prepare environment as follows:
## 1. Install Jetty 10.0.15 https://download.eclipse.org/oomph/jetty/release/10.0.15/index.html
## 2. Set the path to the Jetty home in the JETTY_HOME variable. Usually it is the folder where you installed Jetty: "./jetty-home-10.0.15"
## 3. Set the path to the Jetty base in the JETTY_BASE variable. Usually it is the 'base' folder in jetty directory: "./jetty-home-10.0.15/base"
## 4. Build struts-example project. See ./struts-example/README.md for details.
## 5. Add struts-example.war to the Jetty base webapps folder: cp ./struts-example/target/basic-struts.war ./jetty-home-10.0.15/base/webapps
## 6. Then, just run this script.
export JMETER_PLAN="Struts-MVC.jmx"
export JETTY_HOME="./jetty-home-10.0.15"
export JETTY_BASE="./jetty-home-10.0.15/base"
export APPLICATION_JAR="$JETTY_HOME/start.jar jetty.base=$JETTY_BASE jetty.home=$JETTY_HOME"
../jar-profiling.sh