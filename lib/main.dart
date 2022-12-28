import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opentrivia/core/presentation/app_widget.dart';

void main() {
  runZonedGuarded<Future<void>>(
    () async {
      runApp(
        const ProviderScope(
          child: AppWidget(),
        ),
      );
    },
    // ignore: only_throw_errors
    (e, _) => throw e,
  );
}
