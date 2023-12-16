import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_code_app/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post Code!',
      theme: ThemeData(
        useMaterial3: false,
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFDDDDDD),
          primary: const Color(0xFF51A3A3),
          secondary: const Color(0xFFC2E7D9),
          tertiary: const Color(0xFF247BA0),
        ),
      ),
      home: const HomePage(),
    );
  }
}
