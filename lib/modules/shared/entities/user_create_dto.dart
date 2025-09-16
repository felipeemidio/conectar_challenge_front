import 'package:conectar_challenge_front/modules/shared/entities/user.dart';

class UserCreateDto {
  final String name;
  final String email;
  final String password;
  final UserRole role;

  const UserCreateDto({
    required this.name,
    required this.email,
    required this.password,
    this.role = UserRole.user,
  });
}
