import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:opentrivia/core/shared/app_circular_icon.dart';

import 'shared_robot.dart';

void main() {
  testWidgets(
    'Should render AppCircularIcon widget.',
    (tester) async {
      final r = SharedRobot(tester);
      const mockIconData = Icons.check;
      const mockColor = Colors.green;

      await r.pumpEntryForSharedWidgets(
        const AppCircularIcon(
          icon: mockIconData,
          color: mockColor,
        ),
      );
      r.expectAppCircularIconFound();
    },
  );
}
