import 'package:flutter/material.dart';
import 'package:olib/views/collection.dart';
import 'package:olib/views/profile_screen.dart';
import 'package:olib/widgets/bottom_navigation.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(20.0),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff14161b),
                        height: 40 / 32,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'What are you\nreading'),
                        TextSpan(
                          text: ' today?',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Action when the first button is pressed
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          primary: Colors.white,
                        ),
                        child: Container(
                          width: constraints.maxWidth * 0.4,
                          child: Column(
                            children: [
                              Image.asset('assets/images/bumi.jpg'),
                              Text(
                                'Bumi',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Tere Liye',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Action when the second button is pressed
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          primary: Colors.white,
                        ),
                        child: Container(
                          width: constraints.maxWidth * 0.4,
                          child: Column(
                            children: [
                              Image.asset('assets/images/selena.jpeg'),
                              Text(
                                'Selena',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Tere Liye',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Continue Reading",
                      style: TextStyle(
                        fontFamily: "Roboto Serif",
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff14161b),
                        height: 32 / 32,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                // Tambahkan card di bawah teks "Continue Reading"
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: constraints.maxWidth *
                              0.4, // Atur lebar gambar sesuai kebutuhan
                          height: constraints.maxWidth *
                              0.4 *
                              (4 / 3), // Sesuaikan tinggi gambar
                          child: Image.asset(
                            'assets/images/matahari.jpg', // Ganti dengan asset gambar buku Anda
                            fit: BoxFit.cover, // Sesuaikan tampilan gambar
                          ),
                        ),
                        SizedBox(
                          height:
                              10.0, // Sesuaikan jarak antara gambar dan progress bar
                        ),
                        LinearProgressIndicator(
                          value:
                              0.3, // Sesuaikan nilai progress sesuai kebutuhan
                        ),
                        SizedBox(
                          height:
                              10.0, // Sesuaikan jarak antara progress bar dan judul
                        ),
                        Text(
                          'Matahari',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Tere Liye',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTabTapped: (index) {
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Collection()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Profile()),
            );
          }
        },
        currentIndex: 0,
      ),
    );
  }
}
