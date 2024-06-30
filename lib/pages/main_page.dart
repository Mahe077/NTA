import 'package:flutter/material.dart';
import 'package:nta/core/constants.dart';
import 'package:nta/pages/new_or_edit_page.dart';
import 'package:nta/widgets/note_add.dart';
import 'package:nta/widgets/note_button.dart';
import 'package:nta/widgets/note_icon_button.dart';
import 'package:nta/widgets/notes_grid.dart';
import 'package:nta/widgets/notes_list.dart';
import 'package:nta/widgets/search_field.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> dropdownOptions = ["Date created", "Date modified"];
  late String dropdownValue = dropdownOptions.first;

  bool isDesceding = true;
  bool isGrid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NTA"),
        actions: [
          NoteIconButton(
            icon: Icons.logout,
            onPressed: () {},
          )
        ],
      ),
      floatingActionButton: NoteAdd(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const NewOrEditPage(
                        isNewNote: true,
                      )));
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const searchField(),
            // view options
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  NoteButton(
                    icon:
                        isDesceding ? Icons.arrow_downward : Icons.arrow_upward,
                    onPressed: () {
                      setState(() {
                        isDesceding = !isDesceding;
                      });
                    },
                    size: 18,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.sort,
                          size: 18,
                          color: grey700,
                        ),
                      ),
                      underline: const SizedBox.shrink(),
                      borderRadius: BorderRadius.circular(12),
                      isDense: true,
                      items: dropdownOptions
                          .map((i) => DropdownMenuItem(
                                value: i,
                                child: Row(
                                  children: [
                                    Text(i),
                                    if (i == dropdownValue) ...[
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      const Icon(Icons.check)
                                    ]
                                  ],
                                ),
                              ))
                          .toList(),
                      selectedItemBuilder: (context) =>
                          dropdownOptions.map((e) => Text(e)).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      }),
                  const Spacer(),
                  NoteButton(
                    icon: isGrid ? Icons.grid_view : Icons.menu,
                    onPressed: () {
                      setState(() {
                        isGrid = !isGrid;
                      });
                    },
                    size: 18,
                  )
                ],
              ),
            ),
            Expanded(
              child: isGrid ? const NotesGrid() : const NotesList(),
            )
          ],
        ),
      ),
    );
  }
}
