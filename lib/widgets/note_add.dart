import 'package:flutter/material.dart';
import 'package:nta/core/constants.dart';

class NoteAdd extends StatelessWidget {
  const NoteAdd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {},
        backgroundColor: primary,
        foregroundColor: white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: const Icon(
          Icons.add,
        ));
  }
}
