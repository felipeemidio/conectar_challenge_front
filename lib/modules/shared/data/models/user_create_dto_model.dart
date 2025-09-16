import 'package:conectar_challenge_front/modules/shared/entities/user_create_dto.dart';

class UserCreateDtoModel extends UserCreateDto {
  const UserCreateDtoModel({
    required super.name,
    required super.email,
    required super.password,
    required super.role,
  });

  factory UserCreateDtoModel.fromEntity(UserCreateDto user) => UserCreateDtoModel(
    name: user.name,
    email: user.email,
    password: user.password,
    role: user.role,
  );

  Map<String, dynamic> toMap() => {
    'name': name,
    'email': email,
    'password': password,
    'role': role.toString(),
  };
}
