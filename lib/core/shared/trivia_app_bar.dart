import 'package:flutter/material.dart';

class TriviaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TriviaAppBar({
    required this.title,
    this.actions,
    this.elevation = 0.0,
    super.key,
  });
  final String title;
  final List<Widget>? actions;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      elevation: elevation,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(46);
}
