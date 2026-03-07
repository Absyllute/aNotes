import 'package:anotes/home-screen/home_screen.dart';
import 'package:anotes/themes/colours.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Anotes());
}

class Anotes extends StatefulWidget {
  const Anotes({super.key});

  @override
  State<Anotes> createState() => AnNotesState();
}

class AnNotesState extends State<Anotes> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      
      theme: ThemeData(
        fontFamily: 'Quicksand',

        scaffoldBackgroundColor: Colours.secondaryColour,
      ),
    );
  }
}