import 'package:flutter/material.dart';
import 'package:nta/core/constants.dart';

class NoteButton extends StatelessWidget {
  const NoteButton({
    required this.icon,
    this.size,
    required this.onPressed,
    super.key,
  });

  final IconData icon;
  final double? size;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      constraints: const BoxConstraints(),
      style:
          IconButton.styleFrom(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
      iconSize: size,
      color: grey700,
    );
  }
}
