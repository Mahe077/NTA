import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:nta/core/constants.dart';
import 'package:nta/pages/main_page.dart';
import 'package:nta/widgets/note_button.dart';
import 'package:nta/widgets/note_icon_button.dart';
import 'package:nta/widgets/note_tool_bar.dart';

class NewOrEditPage extends StatefulWidget {
  const NewOrEditPage({required this.isNewNote, super.key});
  final bool isNewNote;
  @override
  State<NewOrEditPage> createState() => _NewOrEditPage();
}

class _NewOrEditPage extends State<NewOrEditPage> {
  late final QuillController quillController;
  late final FocusNode focusNode;
  late bool readOnly;

  @override
  void initState() {
    super.initState();

    quillController = QuillController.basic();

    focusNode = FocusNode();

    if (widget.isNewNote) {
      focusNode.requestFocus();
      readOnly = false;
    } else {
      readOnly = true;
    }
    quillController.readOnly = readOnly;
  }

  @override
  void dispose() {
    quillController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: NoteIconButton(
              icon: Icons.arrow_back_ios_new,
              onPressed: () {
                Navigator.maybePop(context);
              }),
        ),
        title: Text(widget.isNewNote ? "New Note" : "Edit Note"),
        actions: [
          NoteIconButton(
              onPressed: () {
                setState(() {
                  readOnly = !readOnly;
                  quillController.readOnly = readOnly;
                  if (readOnly) {
                    FocusScope.of(context).unfocus();
                  }
                });
              },
              icon: readOnly ? Icons.edit : Icons.menu_book),
          NoteIconButton(onPressed: () {}, icon: Icons.check)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              canRequestFocus: !readOnly,
              decoration: const InputDecoration(
                  hintText: "Add title",
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: grey300)),
            ),
            if (!widget.isNewNote) ...[
              const Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Last Modified',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: grey500),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      '01 December 2024, 03:35 PM',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              const Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Text(
                        'Created',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: grey500),
                      )),
                  Expanded(
                      flex: 5,
                      child: Text('01 December 2024, 03:35 PM',
                          style: TextStyle(fontWeight: FontWeight.bold)))
                ],
              )
            ],
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      const Text(
                        'Tags',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: grey500),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      NoteButton(
                        icon: Icons.add_circle,
                        onPressed: () {},
                        size: 18,
                      )
                    ],
                  ),
                ),
                const Expanded(
                    flex: 5,
                    child: Text('No tags added',
                        style: TextStyle(fontWeight: FontWeight.bold)))
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                color: grey500,
                thickness: 2,
              ),
            ),
            Expanded(
              child: QuillEditor.basic(
                configurations: QuillEditorConfigurations(
                    controller: quillController,
                    placeholder: 'Add the note...',
                    expands: true),
                focusNode: focusNode,
              ),
            ),
            if (!readOnly) NoteTooBar(quillController: quillController),
          ],
        ),
      ),
    );
  }
}
