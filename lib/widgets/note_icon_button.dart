import 'package:flutter/material.dart';

import '../core/constants.dart';

class NoteIconButton extends StatelessWidget {
  const NoteIconButton({
    required this.icon,
    required this.onPressed,
    super.key,
  });
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
      ),
      style: IconButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
    );
  }
}
