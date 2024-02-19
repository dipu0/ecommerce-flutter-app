import 'package:ecommerce/feature/cart_screen/data/manage_cart.dart';
import 'package:ecommerce/feature/product_screen/data/product.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Product Image
            Container(
              width: double.infinity,
              height: 300,
              child: CachedNetworkImage(
                imageUrl: product.imageUrl ?? '',
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
            // Product Title
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                product.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            // Product Price
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'BDT ${product.price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, color: Colors.redAccent),
              ),
            ),
            // Product Description
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                product.description,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              // Add to Cart logic
              CartManager.addToCart(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Item added to cart'),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.green,
              minimumSize: Size(double.infinity, 50),
            ),
            child: Text('Add to Cart'),
          ),
        ),
      ),
    );
  }
}
