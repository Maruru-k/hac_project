class User {
  int id;

  User({
    required this.id,
  });

  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
    );
  }
}
