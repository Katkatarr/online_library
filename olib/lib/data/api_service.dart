import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<User>> fetchUsers() async {
  final response = await http.get(
      'https://654196fef0b8287df1fe82b2.mockapi.io/api/login/:endpoint' as Uri);

  if (response.statusCode == 200) {
    Iterable list = json.decode(response.body);
    List<User> users = List<User>.from(list.map((user) => User.fromJson(user)));
    return users;
  } else {
    throw Exception('Gagal mengambil data pengguna');
  }
}

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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      role: json['role'],
    );
  }
}
