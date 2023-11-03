class User {
  final int id;
  final String username;
  final String password;
  final String role;

  User(
      {required this.id,
      required this.username,
      required this.password,
      required this.role});
}

List<User> dummyUsers = [
  User(id: 1, username: "admin", password: "admin123", role: "admin"),
  User(id: 2, username: "user1", password: "user123", role: "user"),
];
