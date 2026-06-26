class MenuItemModel {
  final String name;
  late final String id;
  final int price;
  final String image;
  final String discription;

  MenuItemModel({
    required this.name,
    required this.id,
    required this.price,
    required this.image,
    required this.discription,
  });

  factory MenuItemModel.fromMap(Map<String, dynamic> data) {
    return MenuItemModel(
      name: data['name'] ?? '',
      id: data['id'] ?? '',
      price: data['price'] ?? 0,
      image: data['image'] ?? '',
      discription: data['discription'] ?? '',
    );
  }
}
