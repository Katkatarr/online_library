// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:olib/providers/userprovider.dart';
// import 'package:olib/views/admin/admin.dart';
// import 'dart:convert';
// import 'package:provider/provider.dart';
// import 'package:olib/views/authentication/signup_screen.dart';
// import 'package:olib/views/dashboard.dart';

// class LoginViewModel with ChangeNotifier {
//   bool _isPasswordVisible = false;
//   bool get isPasswordVisible => _isPasswordVisible;

//   void togglePasswordVisibility() {
//     _isPasswordVisible = !_isPasswordVisible;
//     notifyListeners();
//   }
// }

// class LoginScreen extends StatelessWidget {
//   Future<void> loginUser(
//     BuildContext context,
//     String username,
//     String password,
//   ) async {
//     if (username.isEmpty || password.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Username and password are required.'),
//         ),
//       );
//       return;
//     }

//     final response = await http.get(
//       'https://654196fef0b8287df1fe82b2.mockapi.io/api/login/:endpoint' as Uri,
//     );

//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);

//       if (username == 'adminperpus' && password == 'alterra') {
//         Navigator.of(context).pushReplacementNamed('/admin');
//       } else {
//         Navigator.of(context).pushReplacementNamed('/dashboard');
//         final user = User(username);
//         Provider.of<UserProvider>(context, listen: false).setUser(user);
//       }

//       return;
//     }

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Username or password is incorrect.'),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final loginViewModel = Provider.of<LoginViewModel>(context);
//     TextEditingController usernameController = TextEditingController();
//     TextEditingController passwordController = TextEditingController();

//     return Scaffold(
//       body: Center(
//         child: Container(
//           color: Color(0xFFA2D5F2),
//           width: double.infinity,
//           height: double.infinity,
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: Image.asset(
//                       'assets/images/login_boys.png',
//                       width: 200,
//                     ),
//                   ),
//                   Spacer(),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Color.fromARGB(255, 226, 226, 224),
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(15),
//                         topRight: Radius.circular(15),
//                       ),
//                     ),
//                     width: double.infinity,
//                     height: MediaQuery.of(context).size.height * 2.5 / 4,
//                     padding: EdgeInsets.all(20.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Align(
//                           alignment: Alignment.center,
//                           child: Text(
//                             "Welcome Back!",
//                             style: TextStyle(
//                               fontFamily: "Roboto Serif",
//                               fontSize: 40.33,
//                               fontWeight: FontWeight.w700,
//                               color: Color(0xff076896),
//                             ),
//                             textAlign: TextAlign.left,
//                           ),
//                         ),
//                         Text(
//                           "Welcome back, we missed you",
//                           style: const TextStyle(
//                             fontFamily: "Roboto Serif",
//                             fontSize: 14.33,
//                             fontWeight: FontWeight.w500,
//                             color: Color(0xffa4a4a4),
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                         SizedBox(height: 20),
//                         TextField(
//                           controller: usernameController,
//                           decoration: InputDecoration(
//                             labelText: 'Username*',
//                             border: OutlineInputBorder(),
//                             contentPadding: EdgeInsets.all(12),
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         TextField(
//                           controller: passwordController,
//                           obscureText: !loginViewModel.isPasswordVisible,
//                           decoration: InputDecoration(
//                             labelText: 'Password*',
//                             border: OutlineInputBorder(),
//                             contentPadding: EdgeInsets.all(12),
//                             suffixIcon: IconButton(
//                               icon: Icon(
//                                 loginViewModel.isPasswordVisible
//                                     ? Icons.visibility
//                                     : Icons.visibility_off,
//                               ),
//                               onPressed: () {
//                                 loginViewModel.togglePasswordVisibility();
//                               },
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         InkWell(
//                           onTap: () {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder: (context) => SignupScreen(),
//                               ),
//                             );
//                           },
//                           child: Text(
//                             "Or Register Now",
//                             style: TextStyle(
//                               color: Colors.blue,
//                               decoration: TextDecoration.underline,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         ElevatedButton(
//                           onPressed: () {
//                             final username = usernameController
//                                 .text; // Menggunakan controller untuk mendapatkan username dari TextField
//                             final password = passwordController
//                                 .text; // Menggunakan controller untuk mendapatkan password dari TextField

//                             if (username == 'adminperpus' &&
//                                 password == 'alterra') {
//                               Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (context) => AdminScreen(),
//                               ));
//                             } else {
//                               Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (context) => Dashboard(),
//                               ));
//                             }
//                           },
//                           style: ElevatedButton.styleFrom(
//                             primary: Colors.blue,
//                             minimumSize: Size(314, 50),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15.0),
//                             ),
//                           ),
//                           child: Text('Login', style: TextStyle(fontSize: 18)),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:olib/providers/userprovider.dart';
import 'package:olib/views/admin/admin.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:olib/views/authentication/signup_screen.dart';
import 'package:olib/views/dashboard.dart';

class LoginViewModel with ChangeNotifier {
  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
}

class LoginScreen extends StatelessWidget {
  Future<void> loginUser(
    BuildContext context,
    String username,
    String password,
  ) async {
    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Username and password are required.'),
        ),
      );
      return;
    }

    final response = await http.get(
      'https://654196fef0b8287df1fe82b2.mockapi.io/api/login/:endpoint' as Uri,
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      if (username == 'adminperpus' && password == 'alterra') {
        Navigator.of(context).pushReplacementNamed('/admin');
      } else {
        Navigator.of(context).pushReplacementNamed('/dashboard');
        final user = User(username);
        Provider.of<UserProvider>(context, listen: false).setUser(user);
      }

      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Username or password is incorrect.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Container(
          color: Color(0xFFA2D5F2),
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      'assets/images/login_boys.png',
                      width: 200,
                    ),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 226, 226, 224),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 2.5 / 4,
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Welcome Back!",
                            style: TextStyle(
                              fontFamily: "Roboto Serif",
                              fontSize: 40.33,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff076896),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Text(
                          "Welcome back, we missed you",
                          style: const TextStyle(
                            fontFamily: "Roboto Serif",
                            fontSize: 14.33,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffa4a4a4),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            labelText: 'Username*',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(12),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: passwordController,
                          obscureText: !loginViewModel.isPasswordVisible,
                          decoration: InputDecoration(
                            labelText: 'Password*',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(12),
                            suffixIcon: IconButton(
                              icon: Icon(
                                loginViewModel.isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                loginViewModel.togglePasswordVisibility();
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Or Register Now",
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            final username = usernameController.text;
                            final password = passwordController.text;
                            loginUser(context, username, password);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            minimumSize: Size(314, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: Text('Login', style: TextStyle(fontSize: 18)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
