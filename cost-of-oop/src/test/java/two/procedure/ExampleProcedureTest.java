package two.procedure;

import org.openjdk.jmh.annotations.Benchmark;

public class ExampleProcedureTest {

    @Benchmark
    public void mainTest() {
        Procedural.main();
    }
}