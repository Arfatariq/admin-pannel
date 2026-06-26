class UserModel {
  final String id;
  final String name;
  final String email;
  final String number;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.number,
  });

  factory UserModel.fromMap(Map<String, dynamic> data, String docId) {
    return UserModel(
      id: docId,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      number: data['number'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'number': number,
    };
  }
}
