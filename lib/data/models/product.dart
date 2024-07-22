class Product {
  int id;
  String title;
  double price;
  String description;
  Map<String, dynamic> category;
  List<String> imgs;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.imgs,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      title: json['title'],
      price: double.parse(json['price'].toString()),
      description: json['description'],
      category: json['category'],
      imgs: (json['images'] as List).map((item) => item as String).toList(),
    );
  }
}
