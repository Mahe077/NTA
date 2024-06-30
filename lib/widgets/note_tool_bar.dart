import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:nta/core/constants.dart';

class NoteTooBar extends StatelessWidget {
  const NoteTooBar({
    super.key,
    required this.quillController,
  });

  final QuillController quillController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: primary),
          boxShadow: [BoxShadow(color: primary, offset: Offset(2, 2))]),
      clipBehavior: Clip.hardEdge,
      child: QuillToolbar.simple(
          configurations: QuillSimpleToolbarConfigurations(
              multiRowsDisplay: false,
              controller: quillController,
              // showFontFamily: false,
              showFontSize: false
              // fontSizesValues: const {
              //   'Small': '8',
              //   'Medium': '24.5',
              //   'Large': '46',
              //   'Clear': '0'
              // }
              ,
              customButtons: [
            QuillToolbarCustomButtonOptions(
                icon: const Icon(Icons.mic), onPressed: () {}),
            QuillToolbarCustomButtonOptions(
                icon: const Icon(Icons.stop), onPressed: () {}),
            QuillToolbarCustomButtonOptions(
                icon: const Icon(Icons.pause), onPressed: () {}),
            QuillToolbarCustomButtonOptions(
                icon: const Icon(Icons.graphic_eq), onPressed: () {}),
            QuillToolbarCustomButtonOptions(
                icon: const Icon(Icons.play_arrow), onPressed: () {})
          ])),
    );
  }
}
