import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:olib/views/chatbot/chatbot.dart';
import 'package:olib/main.dart'; // Replace with your app's main file import

void main() {
  testWidgets('ChatRoom UI Test', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(MaterialApp(
      home: ChatRoom(),
    ));

    // Verify that UI elements are present
    expect(find.text('Chat Bot Room'), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(TextFormField), findsOneWidget);
    expect(find.byType(IconButton), findsOneWidget);

    // Perform interaction (e.g., tapping on the send button)
    await tester.tap(find.byType(IconButton));
    await tester.pump();

    // Add more test cases to interact with and validate the UI as needed
  });
}
