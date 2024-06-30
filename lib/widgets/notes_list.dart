import 'package:flutter/material.dart';
import 'package:nta/widgets/note_card.dart';

class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NoteListState();
}

class _NoteListState extends State<NotesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 15,
      itemBuilder: (context, index) {
        return const NoteCard(
          isInGrid: false,
        );
      },
      clipBehavior: Clip.none,
      separatorBuilder: (context, index) => const SizedBox(
        height: 8,
      ),
    );
  }
}
