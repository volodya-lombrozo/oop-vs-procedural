package async.procedure;

public class ExampleProcedure {
    private static int prime(int u) {
        return u;
    }
    private static int discounted(int u) {
        return prime(u) / 2;
    }
    public static void main(String... args) throws InterruptedException {
        int sum = 0;
        for (int i = 0; i < 400_000_000L; ++i) {
            sum += ExampleProcedure.discounted(i);
        }
        System.out.printf("Total: %d\n", sum);
    }
}