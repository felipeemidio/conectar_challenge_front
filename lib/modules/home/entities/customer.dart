class Customer {
  final int id;
  final String name;
  final String cnpj;
  final String fantasyName;
  final bool isActive;
  final bool isPublic;
  final DateTime createdAt;

  const Customer({
    required this.id,
    required this.name,
    required this.cnpj,
    required this.fantasyName,
    required this.isActive,
    required this.isPublic,
    required this.createdAt,
  });
}
