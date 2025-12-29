import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'library_screen.dart';

void main() => runApp(const VocapersoApp());

class VocapersoApp extends StatelessWidget {
  const VocapersoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VOCAPERSO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.inkBlack,
        scaffoldBackgroundColor: AppColors.ghostWhite,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.ghostWhite,
          foregroundColor: AppColors.inkBlack,
          elevation: 0,
        ),
      ),
      home: const LibraryScreen(),
    );
  }
}