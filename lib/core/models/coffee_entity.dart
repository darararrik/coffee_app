class CoffeeEntity {
  final String name;
  final String category;
  final double price;
  final String? imageUrl;

  const CoffeeEntity({
    required this.name,
    required this.category,
    required this.price,
    this.imageUrl,
  });
}