import 'package:anotes/note/note_card.dart';
import 'package:anotes/note/note_data.dart';
import 'package:anotes/note/note_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return NoteScreen();
              },
            )
          );
        },

        icon: Icon(Icons.add),
        label: Text('New Note'),
      ),

      body: ValueListenableBuilder(
        valueListenable: savedNotesBox.listenable(),
        builder: (context, savedNotes, child) {
          List<NoteData> savedNotesList = savedNotes.values.toList().reversed.toList();

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250
            ),
            itemCount: savedNotesList.length,
            itemBuilder: (context, index) {
              return NoteCard(noteData: savedNotesList[index]);
            },
          );
        },
      )
    );
  }
}