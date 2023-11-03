import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:olib/firebase_options.dart';
import 'package:olib/providers/adminprovider.dart';
import 'package:olib/providers/userprovider.dart';
import 'package:olib/test_firestore.dart';
import 'package:olib/viewmodels/authentication/signup_viewmodel.dart';
import 'package:olib/views/admin/admin.dart';
import 'package:olib/views/authentication/login_screen.dart';
import 'package:olib/views/authentication/signup_screen.dart';
import 'package:olib/views/book_description.dart';
import 'package:olib/views/chatbot/chatbot.dart';
import 'package:olib/views/profile_screen.dart';
import 'package:olib/views/welcome_screen.dart';
import 'package:olib/views/collection.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginViewModel>(
          create: (context) => LoginViewModel(),
        ),
        ChangeNotifierProvider<SignupModel>(
          create: (context) => SignupModel(),
        ),
        ChangeNotifierProvider<AdminProvider>(
          create: (context) => AdminProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/book',
        routes: {
          '/login': (context) => LoginScreen(),
          '/signup': (context) => SignupScreen(),
          '/admin': (context) => AdminScreen(),
          '/chat': (context) => ChatRoomApp(),
          '/': (context) => WelcomeScreen(),
          'profile': (context) => Profile(),
          "/collections": (context) => Collection(),
          "/book": (context) => BookDescriptionApp(),
          // Add other routes if needed
        },
      ),
    ),
  );
}
