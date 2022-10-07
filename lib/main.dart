import 'package:flutter/material.dart';
import 'package:wordle/constants/colors.dart';
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
      theme: ThemeData(
        primaryColorLight: lightThemeLightShade,
        primaryColorDark: lightThemeDarkShade,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme().copyWith(
          bodyText2:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
