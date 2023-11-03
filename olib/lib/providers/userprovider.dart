import 'package:flutter/foundation.dart';

class User {
  String username;
  String email;

  User(this.username) : email = '$username@gmail.com';
}

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
