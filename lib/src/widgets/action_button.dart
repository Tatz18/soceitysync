import 'package:flutter/material.dart';
import '../utils/constants.dart';


class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;

  const ActionButton({super.key, required this.text, required this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(text, style: const TextStyle(fontSize: 14)),
    );
  }
}