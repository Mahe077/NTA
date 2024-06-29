import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> dropdownOptions = ["Date created", "Date modified"];
  late String dropdownValue = dropdownOptions.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NTA"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                  labelText: 'Search note....', prefixIcon: Icon(Icons.search)),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_downward)),
                DropdownButton(
                    value: dropdownValue,
                    items: dropdownOptions
                        .map((i) => DropdownMenuItem(
                              value: i,
                              child: Text(i),
                            ))
                        .toList(),
                    onChanged: (newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    }),
                Spacer(),
                IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
              ],
            )
          ],
        ),
      ),
    );
  }
}
