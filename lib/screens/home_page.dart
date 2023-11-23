import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_code_app/styles/app_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 4.0,
        title: Text(
          "Post Code!",
          style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
            color: AppStyles.celticblue,
            letterSpacing: .5,
            fontSize: 26,
          )),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
