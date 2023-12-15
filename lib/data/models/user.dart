User? loggedInUser;
Admin? loggedInAdmin;

class AppUser {
  final String username;
  final int id;
  final UserRole role;

  AppUser({required this.username, required this.id, required this.role});
}

// Implementasi class Admin
class Admin extends AppUser {
  Admin({required super.username, required super.id})
      : super(role: UserRole.admin);
}

// Implementasi class User
class User extends AppUser {
  User({required super.username, required super.id})
      : super(role: UserRole.user);
}

enum UserRole {
  user,
  admin,
}
