class User {
  final int id;
  final String name;
  final String email;
  final UserRole role;
  final DateTime createdAt;
  final DateTime updatedAt;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });
}

enum UserRole {
  admin,
  user;

  static convert(String role) {
    if (role == 'admin') {
      return UserRole.admin;
    } else {
      return UserRole.user;
    }
  }

  @override
  String toString() {
    return this == UserRole.admin ? "admin" : "user";
  }
}
