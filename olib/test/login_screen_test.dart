import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:olib/views/authentication/login_screen.dart';
import 'package:olib/main.dart';
//import 'package:olib/views/login_screen.dart'; // Import your LoginScreen widget

// Create a function to set up the widget for testing
Widget buildTestableWidget(Widget widget) {
  return MaterialApp(
    home: widget,
  );
}

void main() {
  testWidgets('LoginScreen UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(LoginScreen()));

    // Your test cases go here
    // Check if UI elements are present, interact with the UI, and validate results.

    // Example: Check if the "Welcome Back!" text is present
    expect(find.text('Welcome Back!'), findsOneWidget);

    // Example: Interact with the login button and validate the result
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // You can add more test cases for interaction and validation as needed.
  });
}
