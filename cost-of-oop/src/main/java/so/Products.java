package so;


public class Products {
    public static void main(final String... args) {
        int sum = 0;
        for (int i = 0; i < 400_000_000; ++i) {
            final Product product = new Product(i);
            sum += product.price();
        }
        System.out.printf("Total: %d\n", sum);
    }

    private static class Product {
        final String name = new String("Banana");
        final int price;

        private Product(final int price) {
            this.price = price;
        }

        public int price() {
            return this.price % 100;
        }
    }
}
