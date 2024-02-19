import 'package:ecommerce/feature/product_screen/data/product.dart';

class Cart {
  final Map<Product, int> items;

  Cart({required this.items});

  double get totalPrice {
    double total = 0;
    items.forEach((product, quantity) {
      total += product.price * quantity;
    });
    return total;
  }
}
