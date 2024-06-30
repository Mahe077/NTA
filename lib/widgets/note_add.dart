import 'package:flutter/material.dart';
import 'package:nta/core/constants.dart';

class NoteAdd extends StatelessWidget {
  const NoteAdd({
    required this.onPressed,
    super.key,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: primary,
        foregroundColor: white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: const Icon(
          Icons.add,
        ));
  }
}
