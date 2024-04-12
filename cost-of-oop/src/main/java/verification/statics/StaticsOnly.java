package verification.statics;

public class StaticsOnly {

    public static void main(String[] args) throws InterruptedException {
        int sum = 0;
        for (int i = 0; i < Integer.MAX_VALUE; ++i) {
            Thread.sleep(10);
            sum += StaticsOnly.discounted(StaticsOnly.prime(i));
        }
        System.out.printf("Total: %d\n", sum);
    }

    private static int prime(final int u) {
        return u;
    }

    private static int discounted(final int u) {
        return u / 2;
    }

}
