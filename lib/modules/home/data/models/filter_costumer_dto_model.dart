import 'package:conectar_challenge_front/modules/home/entities/filter_customer_dto.dart';

class FilterCostumerDtoModel extends FilterCustomerDto {
  const FilterCostumerDtoModel({
    required super.name,
    required super.cnpj,
    required super.isActive,
    required super.startDate,
  });

  factory FilterCostumerDtoModel.fromEntity(FilterCustomerDto filter) {
    return FilterCostumerDtoModel(
      name: filter.name,
      cnpj: filter.cnpj,
      isActive: filter.isActive,
      startDate: filter.startDate,
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (name != null) {
      map['name'] = name;
    }
    if (cnpj != null) {
      map['cnpj'] = cnpj;
    }
    if (isActive != null) {
      map['isActive'] = isActive;
    }
    if (startDate != null) {
      map['startDate'] = startDate!.toIso8601String();
    }

    return map;
  }
}
