import 'package:anotes/home-screen/home_screen.dart';
import 'package:anotes/note/note_data.dart';
import 'package:anotes/themes/colours.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(NoteDataAdapter());

  await Hive.openBox<NoteData>('savedNotesBox');

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

        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder()
          }
        ),

        appBarTheme: AppBarTheme(
          backgroundColor: Colours.primaryColour,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),

        dividerTheme: DividerThemeData(
          color: Colours.secondaryColour,
          thickness: 6,
          radius: BorderRadius.circular(6),
          endIndent: 5,
          indent: 5
        ),

        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colours.primaryColour,
          foregroundColor: Colors.white,
          splashColor: Colours.secondaryColour
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colours.primaryColour,

          hintStyle: TextStyle(
            fontFamily: 'Outfit',
            color: Colors.white.withAlpha(150),
            fontSize: 18
          ),

          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15)
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colours.primaryColour,
            foregroundColor: Colors.white
          )
        )
      ),
    );
  }
}