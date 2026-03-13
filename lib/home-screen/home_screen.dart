import 'package:anotes/note/edit_note.dart';
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

          List<NoteData> savedNotesList = savedNotes.values.toList();
          List savedNotesKey = savedNotes.keys.toList();

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250
            ),
            itemCount: savedNotesList.length,
            itemBuilder: (context, index) {
              return NoteCard(
                noteData: savedNotesList[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditNote(
                        index: savedNotesKey[index],
                        noteData: savedNotesList[index]
                      ),
                    )
                  );
                },

                onDelete: () {
                  Navigator.pop(context);
                  savedNotesBox.delete(savedNotesKey[index]);
                },
              );
            },
          );
        },
      )
    );
  }
}