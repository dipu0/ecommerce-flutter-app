import 'package:ecommerce/feature/cart_screen/data/cart.dart';
import 'package:ecommerce/feature/product_screen/data/product.dart';

class CartManager {
  static final Cart cart = Cart(items: {});

  static void addToCart(Product product) {
    if (cart.items.containsKey(product)) {
      cart.items[product] = cart.items[product]! + 1;
    } else {
      cart.items[product] = 1;
    }
  }

  static void removeFromCart(Product product) {
    if (cart.items.containsKey(product) && cart.items[product]! > 1) {
      cart.items[product] = cart.items[product]! - 1;
    } else {
      cart.items.remove(product);
    }
  }

  static void removeProductCompletely(Product product) {
    cart.items.remove(product);
  }
}
