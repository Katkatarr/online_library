import 'dart:io';

import 'package:flutter/material.dart';
import 'package:olib/views/dashboard.dart';
import 'package:olib/views/profile_screen.dart';
import 'package:olib/widgets/bottom_navigation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Ebook {
  String cover;
  String title;
  String author;
  String isbn;

  Ebook({
    required this.cover,
    required this.title,
    required this.author,
    required this.isbn,
  });
}

class EbookStorage {
  static const String _ebookStorageKey = "ebook_storage";

  Future<void> saveEbook(Ebook ebook, File pdfFile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(_ebookStorageKey + "_cover", ebook.cover);
    await prefs.setString(_ebookStorageKey + "_title", ebook.title);
    await prefs.setString(_ebookStorageKey + "_author", ebook.author);
    await prefs.setString(_ebookStorageKey + "_isbn", ebook.isbn);

    Directory appDocDir = await getApplicationDocumentsDirectory();
    File pdfStoredFile = File(join(appDocDir.path, 'ebook.pdf'));
    await pdfStoredFile.writeAsBytes(await pdfFile.readAsBytes());
  }

  Future<Ebook> getEbook() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String cover = prefs.getString(_ebookStorageKey + "_cover") ?? '';
    String title = prefs.getString(_ebookStorageKey + "_title") ?? '';
    String author = prefs.getString(_ebookStorageKey + "_author") ?? '';
    String isbn = prefs.getString(_ebookStorageKey + "_isbn") ?? '';

    Directory appDocDir = await getApplicationDocumentsDirectory();
    File pdfStoredFile = File(join(appDocDir.path, 'ebook.pdf'));

    return Ebook(cover: cover, title: title, author: author, isbn: isbn);
  }
}

class Collection extends StatefulWidget {
  @override
  _CollectionState createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  final EbookStorage ebookStorage = EbookStorage();
  List<Ebook> allEbooks = [];
  List<Ebook> displayedEbooks = [];

  @override
  void initState() {
    super.initState();
    loadEbooks();
  }

  void loadEbooks() {
    allEbooks = [
      Ebook(
        cover: 'assets/images/bumi.jpg',
        title: 'Bumi',
        author: 'Tere Liye',
        isbn: '978-1234567891',
      ),
      Ebook(
        cover: 'assets/images/Matahari.jpg',
        title: 'Matahari',
        author: 'Tere Liye',
        isbn: '978-9876543210',
      ),
      Ebook(
        cover: 'assets/images/selena.jpeg',
        title: 'Selena',
        author: 'Tere Liye',
        isbn: '978-9876543210',
      ),
      Ebook(
        cover: 'assets/images/bintang.jpg',
        title: 'Bintang',
        author: 'Tere Liye',
        isbn: '978-9876543210',
      ),
      // Tambahkan eBook lainnya ke dalam daftar.
    ];

    displayedEbooks = List.from(allEbooks);
  }

  void searchEbooks(String query) {
    if (query.isEmpty) {
      setState(() {
        displayedEbooks = List.from(allEbooks);
      });
    } else {
      setState(() {
        displayedEbooks = allEbooks
            .where((ebook) =>
                ebook.title.toLowerCase().contains(query.toLowerCase()) ||
                ebook.author.toLowerCase().contains(query.toLowerCase()) ||
                ebook.isbn.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collection'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Collection',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (query) {
                      searchEbooks(query);
                    },
                  ),
                ),
                if (displayedEbooks.isEmpty)
                  Center(
                    child: Text('No results'),
                  )
                else
                  Column(
                    children: displayedEbooks.map((ebook) {
                      return ListTile(
                        title: FractionallySizedBox(
                          widthFactor: 0.7,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Column(
                              children: [
                                Image.asset(ebook.cover),
                                Text(
                                  ebook.title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ebook.author,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTabTapped: (index) {
          if (index == 0) {
            // Navigasi ke halaman dashboard.dart saat tombol "Home" ditekan
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Profile()),
            );
          }
        },
        currentIndex: 2,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Collection(),
  ));
}
