import 'package:flutter/material.dart';
import 'package:wordle/pages/home_page.dart';

main() => runApp(const WordleApp());

class WordleApp extends StatelessWidget {
  const WordleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wordle',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}