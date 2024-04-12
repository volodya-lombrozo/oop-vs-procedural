package one.oop;

class ObjectOriented {

    public static void main(String... args) {
        int sum = 0;
        for (int i = 0; i < 40_000_000; ++i) {
            Book b = new Prime(i);
            sum += b.price();
        }
        System.out.printf("Total: %d\n", sum);
    }

    interface Book {
        int price();

    }

    static class Prime implements Book {
        private int usd;

        Prime(int u) {
            usd = u;
        }

        @Override
        public int price() {
            return usd;
        }

    }
}
