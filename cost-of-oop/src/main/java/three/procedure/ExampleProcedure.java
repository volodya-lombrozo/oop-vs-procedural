package three.procedure;

public class ExampleProcedure {
    private static int prime(int u) {
        return u;
    }

    private static int discounted(int u) {
        return u / 2;
    }

    public static void main(String... args) {
        int sum = 0;
        for (int i = 0; i < 40_000_000L; ++i) {
            sum += discounted(discounted(prime(i)));
        }
        System.out.printf("Total: %d\n", sum);
    }
}