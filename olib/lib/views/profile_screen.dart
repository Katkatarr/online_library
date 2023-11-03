import 'package:flutter/material.dart';
import 'package:olib/views/authentication/login_screen.dart';
import 'package:olib/views/collection.dart';
import 'package:olib/views/dashboard.dart';
import 'package:olib/widgets/bottom_navigation.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: 450.0, // Lebar box
            height: 269.0, // Tinggi box
            decoration: BoxDecoration(
              color: Color(0xFFF3F8FB), // Warna latar belakang
              borderRadius: BorderRadius.only(
                bottomRight:
                    Radius.circular(40.0), // Rounded di sisi kanan bawah
              ), // Warna latar belakang
              boxShadow: [
                BoxShadow(
                  color: Colors.grey, // Warna shadow
                  offset: Offset(0.0, 2.0), // Geser shadow di sumbu X dan Y
                  blurRadius: 6.0, // Tingkat keburaman shadow
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20), // Spasi dari atas
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight:
                        Radius.circular(15.0), // Rounded di sisi kanan bawah
                  ),
                  child: Container(
                    width: 99.0, // Lebar gambar lingkaran
                    height: 99.0, // Tinggi gambar lingkaran
                    decoration: BoxDecoration(
                      shape:
                          BoxShape.circle, // Membuat gambar berbentuk lingkaran
                      color: const Color.fromARGB(
                        255,
                        178,
                        182,
                        185,
                      ), // Warna latar belakang gambar
                    ),
                    child: Icon(
                      Icons
                          .person, // Icon untuk profil (ganti sesuai kebutuhan)
                      size: 60, // Ukuran ikon
                      color: Colors.white, // Warna ikon
                    ),
                  ),
                ),
                SizedBox(height: 10), // Spasi antara ikon dan teks
                Text(
                  "Katarina Andrea",
                  style: TextStyle(
                    fontFamily: "Roboto Serif",
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff14161b),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  "kata@gmail.com",
                  style: const TextStyle(
                    fontFamily: "Roboto Serif",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 203, 204, 207),
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          // Tambahkan My Books dan Log Out di luar Container
          Padding(
            padding: EdgeInsets.all(20.0), // Atur jarak dari tepi layar
            child: Column(
              children: <Widget>[
                // My Books
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.book, // Icon untuk My Books
                      size: 28, // Ukuran ikon
                      color: Color(0xff14161b), // Warna ikon
                    ),
                    SizedBox(width: 10),
                    Text(
                      "My Books",
                      style: TextStyle(
                        fontFamily: "Roboto Serif",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff14161b),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Log Out
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.exit_to_app, // Icon untuk Log Out
                      size: 28, // Ukuran ikon
                      color: Color(0xff14161b), // Warna ikon
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        // Tambahkan logika di sini untuk menghapus token atau data sesuai kebutuhan Anda
                        // Setelah logout, kita akan kembali ke halaman login
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                          (route) => false,
                        );
                      },
                      child: Text(
                        "Log Out",
                        style: TextStyle(
                          fontFamily: "Roboto Serif",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff14161b),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTabTapped: (index) {
          if (index == 0) {
            // Navigasi ke halaman dashboard.dart saat tombol "Home" ditekan
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Collection()),
            );
          }
        },
        currentIndex: 2,
      ),
      // Indeks "Profile" adalah 2
    );
  }
}
