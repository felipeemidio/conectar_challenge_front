import 'package:conectar_challenge_front/core/utils/app_caster.dart';
import 'package:conectar_challenge_front/modules/home/entities/customer.dart';

class CustomerModel extends Customer {
  const CustomerModel({
    required super.id,
    required super.name,
    required super.cnpj,
    required super.fantasyName,
    required super.isActive,
    required super.isPublic,
    required super.createdAt,
  });

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      id: AppCaster.toInt(map['id'], required: true),
      name: AppCaster.toText(map['name'], required: true),
      cnpj: AppCaster.toText(map['cnpj'], required: true),
      fantasyName: AppCaster.toText(map['fantasyName'], required: true),
      isActive: AppCaster.toBool(map['isActive'], required: true),
      isPublic: AppCaster.toBool(map['isPublic'], required: true),
      createdAt: AppCaster.toDateTime(map['createdAt'], required: true)!,
    );
  }
}
