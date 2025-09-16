import 'package:conectar_challenge_front/modules/home/entities/customer_create_dto.dart';

class CustomerCreateDtoModel extends CustomerCreateDto {
  const CustomerCreateDtoModel({
    required super.name,
    required super.cnpj,
    required super.fantasyName,
    required super.isActive,
    required super.isPublic,
  });

  factory CustomerCreateDtoModel.fromEntity(CustomerCreateDto entity) {
    return CustomerCreateDtoModel(
      name: entity.name,
      cnpj: entity.cnpj,
      fantasyName: entity.fantasyName,
      isActive: entity.isActive,
      isPublic: entity.isPublic,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cnpj': cnpj,
      'fantasyName': fantasyName,
      'isActive': isActive,
      'isPublic': isPublic,
    };
  }
}
