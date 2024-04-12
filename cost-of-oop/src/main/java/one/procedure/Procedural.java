package one.procedure;

public class Procedural {
    private static int prime(int u) {
        return u;
    }
    private static int discounted(int u) {
        return prime(u) / 2;
    }
    public static void main(String... args) {
        int sum = 0;
        for (int i = 0; i < 40_000_000L; ++i) {
            sum += Procedural.discounted(i);
        }
        System.out.printf("Total: %d\n", sum);
    }
}