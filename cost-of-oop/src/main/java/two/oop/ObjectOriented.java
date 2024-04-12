package two.oop;

class ObjectOriented {

    public static void main(String... args) {
        int sum = 0;
        for (int i = 0; i < 40_000_000; ++i) {
            sum += new Discounted(new Prime(i)).price();
        }
        System.out.printf("Total: %d\n", sum);
    }

    interface Book {
        int price();
    }

    static class Discounted implements Book {
        private Book book;
        Discounted(Book b) {
            book = b;
        }
        @Override
        public int price() {
            return book.price() / 2;
        }
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
