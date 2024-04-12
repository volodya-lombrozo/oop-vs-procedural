package async.oop;

class ExampleOOP {

    public static void main(String... args) throws InterruptedException {
        Thread.sleep(900);
        int sum = 0;
        for (int i = 0; i < 400_000_000; ++i) {
            Book b = new Discounted(new Prime(i));
            sum += b.price();
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
