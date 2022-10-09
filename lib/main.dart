import 'package:flutter/material.dart';
import 'package:wordle/constants/colors.dart';
import 'package:wordle/providers/controller.dart';
import 'package:wordle/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:wordle/providers/theme_provider.dart';
import 'package:wordle/theme/themes.dart';

main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => Controller(),
          ),
          ChangeNotifierProvider(
            create: (_) => ThemeProvider(),
          ),
        ],
        child: const WordleApp(),
      ),
    );

class WordleApp extends StatelessWidget {
  const WordleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (_, notifier, __) => MaterialApp(
        title: 'Wordle',
        theme: notifier.isDark ? darkTheme : lightTheme,
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
