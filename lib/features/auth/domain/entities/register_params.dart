import 'package:equatable/equatable.dart';

/// Input parameters required for user registration.
class RegisterParams extends Equatable {
  final String email;
  final String password;
  final String fullName;
  final String phone;

  const RegisterParams({
    required this.email,
    required this.password,
    required this.fullName,
    required this.phone,
  });

  @override
  List<Object?> get props => [email, password, fullName, phone];
}
