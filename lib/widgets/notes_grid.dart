import 'package:flutter/material.dart';

import 'note_card.dart';

class NotesGrid extends StatelessWidget {
  const NotesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 15,
        clipBehavior: Clip.none,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
        ),
        itemBuilder: (context, int index) {
          // note card
          return const NoteCard(
            isInGrid: true,
          );
        });
  }
}
