import 'package:conectar_challenge_front/core/utils/app_caster.dart';
import 'package:conectar_challenge_front/modules/shared/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.role,
    required super.createdAt,
    required super.updatedAt,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: AppCaster.toInt(map['id']),
      name: AppCaster.toText(map['name']),
      email: AppCaster.toText(map['email']),
      role: UserRole.convert(map['role']),
      createdAt: AppCaster.toDateTime(map['createdAt'])!,
      updatedAt: AppCaster.toDateTime(map['updatedAt'])!,
    );
  }
}
