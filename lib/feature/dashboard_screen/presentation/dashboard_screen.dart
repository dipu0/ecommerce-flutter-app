import 'package:ecommerce/feature/product_screen/data/ProductGenerator.dart';
import 'package:ecommerce/feature/product_screen/data/product.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Product> featuredProducts =
      ProductGenerator.generateProducts(); // Example products

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildCarouselSlider(),
            buildCategorySection(),
          ],
        ),
      ),
    );
  }

  Widget buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        autoPlay: true,
      ),
      items: featuredProducts.map((product) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  product.imageUrl ??
                      'https://via.placeholder.com/400x300', // Fallback for no image
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget buildCategorySection() {
    // Assuming you have a method to fetch categories
    final List<String> categories = [
      'Electronics',
      'Fashion',
      'Home & Garden',
      'Toys & Games'
    ]; // Example categories

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics:
            NeverScrollableScrollPhysics(), // to disable GridView's scrolling
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 2,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            child: Center(
              child: Text(categories[index]),
            ),
          );
        },
      ),
    );
  }
}
