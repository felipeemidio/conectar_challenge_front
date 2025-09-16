class CustomerCreateDto {
  final String name;
  final String cnpj;
  final String fantasyName;
  final bool isActive;
  final bool isPublic;

  const CustomerCreateDto({
    required this.name,
    required this.cnpj,
    required this.fantasyName,
    required this.isActive,
    required this.isPublic,
  });
}
