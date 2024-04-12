#!/bin/bash
java ExampleOOP.java -Xmx12294M -Xms12294M -XX:+UnlockExperimentalVMOptions -XX:+UseEpsilonGC &
sleep 0.9
/Users/lombrozo/Workspace/Tools/async-profiler-2.9-macos/profiler.sh -e cpu -i 500us -f res.html $!
open res.html