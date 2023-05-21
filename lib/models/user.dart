class User {
  final int id;
  final String name;
  final String? phoneNumber;
  final String? email;
  final String? avatar;
  final String? company;

  User({
    required this.id,
    required this.name,
    required this.phoneNumber,
    this.email,
    this.avatar,
    this.company,
  });

  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      name: json["name"],
      phoneNumber: json["phone_number"],
      email: json["email"],
      avatar: json["avatar"],
      company: json["company"],
    );
  }
}
