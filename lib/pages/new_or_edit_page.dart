import 'package:flutter/material.dart';
import 'package:nta/widgets/note_icon_button.dart';

class NewOrEditPage extends StatefulWidget {
  const NewOrEditPage({super.key});

  @override
  State<NewOrEditPage> createState() => _NewOrEditPage();
}

class _NewOrEditPage extends State<NewOrEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              NoteIconButton(icon: Icons.arrow_back_ios_new, onPressed: () {}),
        ),
        title: const Text("New Note"),
        actions: [
          NoteIconButton(onPressed: () {}, icon: Icons.edit),
          NoteIconButton(onPressed: () {}, icon: Icons.check)
        ],
      ),
    );
  }
}
