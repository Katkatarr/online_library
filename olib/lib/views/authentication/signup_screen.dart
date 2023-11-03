import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Import yang diperlukan untuk Flutter dan provider

class SignupModel extends ChangeNotifier {
  // Membuat model ChangeNotifier untuk manajemen state
  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    // Method untuk mengubah visibilitas password
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
}

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider<SignupModel>(
//           create: (context) => SignupModel(),
//         ),
//       ],
//       child: MyApp(),
//     ),
//   );
// }

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Color(0xFFA2D5F2),
          width: double.infinity,
          height: double.infinity,
          // Tampilan latar belakang layar
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),

              // Padding di sekitar konten utama
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      'assets/images/login_boys.png',
                      width: 200,
                    ),
                  ),
                  // Gambar di sebelah kanan

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
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(bottom: 0),
                    // Container dengan dekorasi latar belakang dan padding
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Get Started Free",
                            style: TextStyle(
                              fontFamily: "Roboto Serif",
                              fontSize: 40.33,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff076896),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        // Judul

                        Text(
                          "Let's start your journey!",
                          style: const TextStyle(
                            fontFamily: "Roboto Serif",
                            fontSize: 14.33,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffa4a4a4),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        // Subjudul

                        SizedBox(height: 20),

                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Email address',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(12),
                          ),
                        ),
                        // Input email

                        SizedBox(height: 20),

                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Your name',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(12),
                          ),
                        ),
                        // Input nama

                        SizedBox(height: 20),

                        TextField(
                          obscureText:
                              !context.read<SignupModel>().isPasswordVisible,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(12),
                            suffixIcon: IconButton(
                              icon: Icon(
                                  context.read<SignupModel>().isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                              onPressed: () {
                                context
                                    .read<SignupModel>()
                                    .togglePasswordVisibility();
                              },
                            ),
                          ),
                        ),
                        // Input password dengan tombol untuk mengubah visibilitas

                        SizedBox(height: 10),

                        Text(
                          "Have any account? Login Now",
                          style: TextStyle(
                            color: Color(0xFFA2A2A2),
                          ),
                        ),
                        // Teks untuk pindah ke halaman login

                        SizedBox(height: 20),

                        ElevatedButton(
                          onPressed: () {
                            // Logic for signup
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            minimumSize: Size(314, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child:
                              Text('Sign Up', style: TextStyle(fontSize: 18)),
                        ),
                        // Tombol Sign Up
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignupScreen(),
    );
  }
}

// Kelas utama yang membuat dan menjalankan aplikasi Flutter
