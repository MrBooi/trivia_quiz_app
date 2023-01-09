import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:opentrivia/core/shared/app_circular_icon.dart';

class SharedRobot {
  SharedRobot(this.tester);

  final WidgetTester tester;
  Future<void> pumpEntryForSharedWidgets(Widget child) async {
    // * Entry point of the app
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: child,
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  void expectPrimaryButtonFound(String title) async {
    final primaryButton = find.text(title);
    expect(primaryButton, findsOneWidget);
  }

  void expectAppCircularIconFound({
    required IconData icon,
    required Color color,
  }) async {
    final appCircularIcon = find.byWidget(
      AppCircularIcon(
        icon: icon,
        color: color,
      ),
    );
    expect(appCircularIcon, findsOneWidget);
    await tester.pumpAndSettle();
  }

  Future<void> tapPrimaryButton(String title) async {
    final primaryButton = find.text(title);
    expect(primaryButton, findsOneWidget);
    await tester.tap(primaryButton);
    await tester.pumpAndSettle();
  }
}
