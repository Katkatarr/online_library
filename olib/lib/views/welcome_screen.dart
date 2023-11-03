import 'package:flutter/material.dart';
import 'package:olib/views/authentication/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Tampilkan gambar dari assets/images
            Image.asset('assets/images/splashscreen.png'),

            SizedBox(height: 10),

            Center(
              child: Text(
                'Find Your Suitable Books \nRecomendation',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, color: Color(0xFF07689F)),
              ),
            ),

            Center(
              child: Text(
                '\nRead favorite books in their original \nlanguage with parallel \ntranslation',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Color(0xFF83899F)),
              ),
            ),

            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                // Arahkan ke halaman login saat tombol "Get Started" ditekan
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF07689F),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(15.0), // Membuat sudut rounded
                ),
                minimumSize: Size(314, 50), // Menentukan lebar dan tinggi
              ),
              child: Text(
                'Get Started',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
