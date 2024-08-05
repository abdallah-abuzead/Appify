import 'package:equatable/equatable.dart';

class LoginRequest extends Equatable {
  final String phone;
  final String password;

  const LoginRequest({
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "password": password,
        "device_name": "Example Device",
        "device_id": "efd-54632k",
        "device_token": "TEST"
      };

  @override
  List<Object?> get props => [
        phone,
        password,
      ];
}
