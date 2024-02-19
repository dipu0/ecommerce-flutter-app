import 'dart:math';

import 'package:ecommerce/feature/product_screen/data/product.dart';

class ProductGenerator {
  static List<Product> generateProducts() {
    return List.generate(
      50,
      (index) => Product(
        id: 'prod_${index + 1}',
        title: 'Product ${index + 1}',
        brand: 'Brand ${(Random().nextDouble() * 100).floor()}',
        price: (Random().nextDouble() * 100).toDouble(),
        imageUrl:
            'https://prd.place/400/600?id=${index}', // Placeholder image URL
        description: 'This is a detailed description of Product ${index + 1}.',
        category: 'Category ${(Random().nextInt(5) + 1)}',
        stockQuantity: Random().nextInt(50) + 1,
        rating: Random().nextDouble() * 5,
        creationDate: DateTime.now(),
        discountedPrice:
            Random().nextBool() ? Random().nextDouble() * 50 : null,
        isFeatured: Random().nextBool(),
        tags: ['Tag1', 'Tag2', 'Tag3'],
      ),
    );
  }
}
