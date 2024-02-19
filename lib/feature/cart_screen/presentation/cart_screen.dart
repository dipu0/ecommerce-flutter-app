import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/feature/cart_screen/data/manage_cart.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartItems = CartManager.cart.items;
    return Scaffold(
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final product = cartItems.keys.elementAt(index);
          final quantity = cartItems[product]!;
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ListTile(
              leading: product.imageUrl != null
                  ? CircleAvatar(
                      backgroundImage:
                          CachedNetworkImageProvider(product.imageUrl!),
                    )
                  : CircleAvatar(
                      child: Icon(Icons.image), // Default icon
                      backgroundColor: Colors
                          .grey[200], // Optional: Background color for the icon
                    ),
              title: Text(product.title),
              subtitle: Text(
                  '${product.brand} - BDT ${product.price.toStringAsFixed(2)}'),
              trailing: FittedBox(
                fit: BoxFit.fill,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          CartManager.removeFromCart(product);
                        });
                      },
                    ),
                    Text('$quantity'),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          CartManager.addToCart(product);
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete_outline),
                      onPressed: () {
                        setState(() {
                          CartManager.removeProductCompletely(product);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total Price: ${CartManager.cart.totalPrice.toStringAsFixed(2)} Taka',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
