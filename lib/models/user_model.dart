class User {
  final int id;
  final String email, first_name, last_name, avatar;

  User(
      {required this.id,
      required this.email,
      required this.first_name,
      required this.last_name,
      required this.avatar});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      avatar: json['avatar'],
    );
  }
}
