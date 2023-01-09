import 'package:flutter_test/flutter_test.dart';
import 'package:opentrivia/core/shared/app_button.dart';

import 'shared_robot.dart';

void main() {
  testWidgets(
    'Should find Primary button by Text.',
    (tester) async {
      const mockButtonTitle = 'primary-button';
      final r = SharedRobot(tester);

      await r.pumpEntryForSharedWidgets(
        PrimaryButton(
          title: mockButtonTitle,
          onTap: () {},
        ),
      );
      r.expectPrimaryButtonFound(mockButtonTitle);
    },
  );

  testWidgets(
    'Should find Primary button and Tap on it.',
    (tester) async {
      const mockButtonTitle = 'primary-button';
      final r = SharedRobot(tester);

      await r.pumpEntryForSharedWidgets(
        PrimaryButton(
          title: mockButtonTitle,
          onTap: () {},
        ),
      );
      r.tapPrimaryButton(mockButtonTitle);
    },
  );
}
