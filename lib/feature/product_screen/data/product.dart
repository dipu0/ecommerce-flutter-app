class Product {
  final String id;
  final String title;
  final String brand;
  final double price;
  final String? imageUrl; // Made optional
  final String description;
  final String category;
  final int stockQuantity;
  final double rating;
  final DateTime creationDate;
  final double? discountedPrice; // Optional, if there's a discount available
  final bool isFeatured;
  final List<String> tags;

  Product({
    required this.id,
    required this.title,
    required this.brand,
    required this.price,
    this.imageUrl, // No longer required
    required this.description,
    required this.category,
    required this.stockQuantity,
    required this.rating,
    required this.creationDate,
    this.discountedPrice, // Optional
    required this.isFeatured,
    required this.tags,
  });
}
