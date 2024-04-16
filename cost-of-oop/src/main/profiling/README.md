## How to Build and Run Profiling of Applications

To reproduce the profiling results, you need to perform the following steps:

1. Configure the profiling script [jar-profiling.sh](jar-profiling.sh) - you
   need to specify paths to JMeter and YourKit Profiler in it. Detailed
   instructions are included in the script. 
2. Configure scripts for each application in the corresponding folder. You might
   need to build an application or specify the path to an already compiled
   application. Then, you will likely need to set some environment variables.
   Detailed instructions are provided in the scripts.
3. Run the profiling script in the corresponding folder. For example, to
   profile the Micronaut application, you need to run the following command:

   ```shell
   ./micronaut/micronaut-profiling.sh
   ```