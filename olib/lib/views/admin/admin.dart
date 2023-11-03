import 'package:flutter/material.dart';
import 'package:olib/providers/adminprovider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final adminProvider = Provider.of<AdminProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Perpustakaan'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Home'),
              onTap: () {
                // Navigasi ke halaman Home
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () async {
                // Lakukan logout dengan menghapus informasi login
                final prefs = await SharedPreferences.getInstance();
                if (prefs.containsKey('adminperpus')) {
                  prefs.remove(
                      'adminperpus'); // Hanya menghapus jika kunci ada dalam penyimpanan
                }
// Ganti 'user_token' dengan nama yang sesuai
                // Tambahan: Lakukan tindakan logout lainnya jika diperlukan

                // Tutup Drawer dan arahkan kembali ke halaman LoginScreen
                Navigator.pop(context); // Tutup Drawer
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.add_circle,
              size: 100.0,
              color: Colors.blue,
            ),
            Text('Tambahkan Koleksi Buku'),
          ],
        ),
      ),
    );
  }
}
