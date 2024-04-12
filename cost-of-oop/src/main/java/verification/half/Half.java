package verification.half;

public class Half {
    public static void main(final String[] args) throws InterruptedException {
        int sum = 0;
        for (int i = 0; i < Integer.MAX_VALUE; ++i) {
            Book b = new Prime(i);
            sum += discounted(b.price());
            Thread.sleep(10);
        }
        System.out.printf("Total: %d\n", sum);
    }

    interface Book {
        int price();
    }

    private static int discounted(final int u) {
        return u / 2;
    }

    static class Prime implements Book {
        private final int usd;

        Prime(final int u) {
            this.usd = u;
        }

        @Override
        public int price() {
            return this.usd * 3;
        }
    }
}
