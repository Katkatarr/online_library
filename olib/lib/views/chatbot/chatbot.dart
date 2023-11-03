import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(ChatRoomApp());
}

class ChatRoomApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatRoomScreen(),
    );
  }
}

class ChatRoomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Bot Room'),
        backgroundColor: Color.fromARGB(255, 7, 105, 150),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Kembali ke rute sebelumnya
          },
        ),
      ),
      body: ChatRoom(),
    );
  }
}

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  TextEditingController _messageController = TextEditingController();
  List<ChatMessage> messages = [];
  String _response = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEEF0F1),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return messages[index];
              },
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _messageController,
                    decoration: InputDecoration(
                        hintText:
                            'Type description book that you looking for...'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  color: Color(0xFF07089F),
                  onPressed: () {
                    setState(() {
                      String message = _messageController.text;
                      if (message.isNotEmpty) {
                        _submitForm(message);
                        _messageController.clear();
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _submitForm(String userMessage) async {
    String key = '';
    final apiKey = key;
    const apiUrl = 'https://api.openai.com/v1/completions';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode(<String, dynamic>{
        "model": "text-davinci-003",
        'prompt':
            "Sebagai seorang search engineer yang ahli, nama kamu adalah LibBot, tugas kamu adalah memberikan referensi buku berdasarkan deskripsi yang diberikan oleh pengguna. Pengguna telah memberikan deskripsi sebagai berikut:\n\n\"$userMessage\"\n\nDalam peran kamu yang profesional, kamu diminta untuk memberikan referensi buku berdasarkan deskripsi ini. Berikan daftar buku beserta judul,pengarangnya,tahun terbit. Kami ingin hasilnya mengandung 3 data buku terpopuler yang berisi judul, nama pengarang\nTunjukkan seberapa ahli kamu dalam memberikan referensi buku berdasarkan deskripsi ini.",

        // 'prompt':
        //     "kamu sekarang adalah search engginer yang bertugas memberikan referensi buku berdasarkan inputan user" +
        //         "data user akan didapatkan dari variabel berikut $userMessage" +
        //         "berikan referensi berdasarkan 1\n2\n\n3.\noutput yang ingin saya hasilkan hanya berupa title dari setiap bukunya" +
        //         "example output json data {title : judul 1 autor : author 1, }",
        'max_tokens': 100,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print('Respon sukses: ${responseData['choices'][0]['text']}');
      setState(() {
        _response = responseData['choices'][0]['text'];
        messages.add(ChatMessage(
          text: userMessage,
          isUserMessage: true,
        ));
        messages.add(ChatMessage(
          text: _response,
          isUserMessage: false,
        ));
      });
    } else {
      print('Gagal mendapatkan respons. Kode status: ${response.statusCode}');
    }
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUserMessage;

  ChatMessage({required this.text, required this.isUserMessage});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUserMessage ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isUserMessage
              ? Color(0xFF07089F)
              : Color.fromARGB(
                  255, 119, 171, 201), // Warna background bot dan user
          borderRadius: isUserMessage
              ? BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0),
                )
              : BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
