package so;

import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.Benchmark;
import org.openjdk.jmh.annotations.Mode;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.OptionsBuilder;
import org.openjdk.jmh.runner.options.TimeValue;

public class ProductsTest {
    public static void main(String[] args) throws RunnerException {
        new Runner(
            new OptionsBuilder()
                .forks(1)
                .warmupIterations(1)
                .measurementIterations(1)
                .warmupTime(TimeValue.seconds(2))
                .measurementTime(TimeValue.seconds(2))
                .mode(Mode.AverageTime)
                .timeUnit(TimeUnit.MILLISECONDS)
                .build()
        ).run();
    }

    @Benchmark
    public void products() {
        Products.main();
    }
}