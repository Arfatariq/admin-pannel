class Food {
  String name;
  String price;
  String imageUrl;
  String rating;
  String discription;

  Food(
    this.name,
    this.price,
    this.imageUrl,
    this.rating,
    this.discription,
  );

  Food copyWith({
    String? name,
    String? price,
    String? imageUrl,
    String? rating,
    String? discription,
  }) {
    return Food(
      name ?? this.name,
      price ?? this.price,
      imageUrl ?? this.imageUrl,
      rating ?? this.rating,
      discription ?? this.discription,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'rating': rating,
      'discription': discription,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      map['name'] as String,
      map['price'] as String,
      map['imageUrl'] as String,
      map['rating'] as String,
      map['discription'] as String,
    );
  }

  // factory Food.fromMap(Map<String, dynamic> map) {
  //   return Food(
  //     map['name'] as String,
  //     map['price'] as String,
  //     map['imagepath'] as String,
  //     map['rating'] as String,
  //     map['discription'] as String,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory Food.fromJson(String source) =>
  //     Food.fromMap(json.decode(source) as Map<String, dynamic>);

  // @override
  // String toString() {
  //   return 'Food(name: $name,discription: $discription, price: $price, imagepath: $imagepath, rating: $rating)';
  // }

  // @override
  // bool operator ==(covariant Food other) {
  //   if (identical(this, other)) return true;

  //   return other.name == name &&
  //       other.price == price &&
  //       other.imagepath == imagepath &&
  //       other.rating == rating;
  // }

  // @override
  // int get hashCode {
  //   return name.hashCode ^
  //       price.hashCode ^
  //       imagepath.hashCode ^
  //       rating.hashCode;
  // }
}
