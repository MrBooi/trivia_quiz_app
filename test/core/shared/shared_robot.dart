import 'package:flutter_test/flutter_test.dart';
import 'package:opentrivia/core/shared/app_circular_icon.dart';

class SharedRobot {
  SharedRobot(this.tester);

  final WidgetTester tester;

  void expectPrimaryButtonFound(String title) async {
    final primaryButton = find.text(title);
    expect(primaryButton, findsOneWidget);
  }

  void expectAppCircularIconFound() async {
    final appCircularIcon = find.byType(AppCircularIcon);
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
