import 'package:flutter/material.dart';
import 'package:wordle/controller.dart';
import 'package:wordle/pages/home_page.dart';
import 'package:provider/provider.dart';

main() => runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(
      create: (_) => Controller(),
    ),
  ],
  child: const WordleApp(),
));

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