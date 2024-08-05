class User {
  int id;
  String? name;
  String email;
  String? avatar;
  String? phoneVerifiedAt;
  String phone;
  String? emailVerifiedAt;

  String? token;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.phoneVerifiedAt,
    required this.phone,
    required this.avatar,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      email: json['user']['email'],
      name: json['user']['name'],
      phoneVerifiedAt: json['user']['phone_verified_at'],
      phone: json['user']['phone'],
      avatar: json['user']['avatar'],
      token: json['authorization']['token'],
    );
  }
}
