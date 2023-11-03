import 'dart:js';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Book {
  final String title;
  final String author;

  Book(this.title, this.author);
}

class AdminProvider with ChangeNotifier {
  List<Book> _books = []; // Properti untuk menyimpan koleksi buku
  bool _isAddingBook = false; // Properti untuk mengelola status penambahan buku

  // Getter untuk mendapatkan koleksi buku
  List<Book> get books => _books;

  // Getter untuk mendapatkan status penambahan buku
  bool get isAddingBook => _isAddingBook;

  // Metode untuk menambahkan buku ke koleksi
  void addBook(Book book) {
    _books.add(book);
    notifyListeners();
  }

  // Metode untuk mengubah status penambahan buku
  void setAddingBookStatus(bool isAdding) {
    _isAddingBook = isAdding;
    notifyListeners();
  }

  // Metode untuk logout (contoh)
  void logout() async {
    // Hapus informasi login, misalnya token
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('user_token'); // Ganti 'user_token' dengan nama yang sesuai

    // Arahkan pengguna ke halaman login
    Navigator.pushReplacementNamed(context as BuildContext,
        '/login'); // Ganti '/login' dengan rute login yang sesuai
  }
}
