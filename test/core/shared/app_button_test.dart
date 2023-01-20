import 'package:flutter_test/flutter_test.dart';
import 'package:opentrivia/core/shared/app_button.dart';

import '../../robot.dart';

void main() {
  testWidgets(
    'Should find Primary button by Text.',
    (tester) async {
      const mockButtonTitle = 'primary-button';
      final r = Robot(tester);

      await r.pumpEntryForSingleWidget(
        PrimaryButton(
          title: mockButtonTitle,
          onTap: () {},
        ),
      );
      r.shared.expectPrimaryButtonFound(mockButtonTitle);
    },
  );

  testWidgets(
    'Should find Primary button and Tap on it.',
    (tester) async {
      const mockButtonTitle = 'primary-button';
      final r = Robot(tester);

      await r.pumpEntryForSingleWidget(
        PrimaryButton(
          title: mockButtonTitle,
          onTap: () {},
        ),
      );
      r.shared.tapPrimaryButton(mockButtonTitle);
    },
  );
}
