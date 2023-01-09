import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:opentrivia/core/presentation/app_widget.dart';

import 'core/shared/shared_robot.dart';

class Robot {
  Robot(this.tester) : shared = SharedRobot(tester);
  final WidgetTester tester;
  final SharedRobot shared;

  Future<void> pumpMyApp() async {
    // * Entry point of the app
    await tester.pumpWidget(
      const ProviderScope(
        child: AppWidget(),
      ),
    );
    await tester.pumpAndSettle();
  }
}
