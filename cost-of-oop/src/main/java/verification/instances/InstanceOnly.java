package verification.instances;


public class InstanceOnly {

    public static void main(final String[] args) throws InterruptedException {
        int sum = 0;
        for (int i = 0; i < Integer.MAX_VALUE; ++i) {
            Book b =new Discounted(new Prime(i));
            sum += b.price();
            Thread.sleep(10);
        }
        System.out.printf("Total: %d\n", sum);
    }

    interface Book {
        int price();

    }

    static class Discounted implements Book {
        private final Book book;

        Discounted(final Book b) {
            this.book = b;
        }

        @Override
        public int price() {
            return this.book.price() / 2;
        }
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
