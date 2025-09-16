class FilterCustomerDto {
  final String? name;
  final String? cnpj;
  final bool? isActive;
  final DateTime? startDate;

  const FilterCustomerDto({
    this.name,
    this.cnpj,
    this.isActive,
    this.startDate,
  });
}
