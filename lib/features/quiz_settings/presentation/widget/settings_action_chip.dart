import 'package:flutter/material.dart';

class SettingActionChip extends StatelessWidget {
  const SettingActionChip({
    required this.isSelected,
    required this.label,
    this.onPressed,
    super.key,
  });
  final String label;
  final bool isSelected;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(label),
      labelStyle: const TextStyle(color: Colors.white),
      backgroundColor: isSelected ? Colors.green : Colors.grey.shade600,
      onPressed: onPressed,
    );
  }
}
