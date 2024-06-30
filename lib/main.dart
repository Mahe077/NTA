import 'package:flutter/material.dart';
import 'package:nta/core/constants.dart';
import 'package:nta/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NTA',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: background,
          appBarTheme: Theme.of(context).appBarTheme.copyWith(
              // backgroundColor: Colors.transparent,
              titleTextStyle: const TextStyle(
                  color: primary,
                  fontSize: 32,
                  fontFamily: 'Fredoka',
                  fontWeight: FontWeight.bold))),
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}
