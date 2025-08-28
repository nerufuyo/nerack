// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nerack/main.dart';

void main() {
  testWidgets('Nerack app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: NerackApp(),
      ),
    );

    // Verify that our welcome text is displayed.
    expect(find.text('Welcome to Nerack'), findsOneWidget);
    expect(find.text('Your Personal Bookshelf Management App'), findsOneWidget);

    // Verify that we have a FloatingActionButton.
    expect(find.byType(FloatingActionButton), findsOneWidget);

    // Tap the FloatingActionButton and trigger a frame.
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    // Verify that a SnackBar is shown.
    expect(find.text('Clean Architecture Setup Complete!'), findsOneWidget);
  });
}
