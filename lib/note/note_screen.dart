import 'package:anotes/note/note_data.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

var savedNotesBox = Hive.box<NoteData>('savedNotesBox');

class _NoteScreenState extends State<NoteScreen> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController(); 

  @override
  void dispose() { 
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(

                controller: _titleController,
                cursorColor: Colors.white,

                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                ),
                
                decoration: InputDecoration(
                  hintText: 'Title'
                ),
              ),

              SizedBox(height: 6),

              Expanded(
                child: TextField(
                  minLines: null,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  cursorColor: Colors.white,
                  controller: _contentController,

                  decoration: InputDecoration(
                    hintText: 'Note'
                  ),

                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                  ),
                ),
              ),


              SizedBox(height: 8),


              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Expanded(
                    flex: 7,
                    
                    child: ElevatedButton(
                      onPressed: () {
                        if (_titleController.text.isNotEmpty && _contentController.text.isNotEmpty) {
                          savedNotesBox.add(
                            NoteData(
                              noteTitle: _titleController.text,
                              noteContent: _contentController.text
                            )
                          );
                        }
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Save Note',
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 8),

                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      onPressed: () {
                        // clear text, but dont distroy controller
                      },

                      child: Text(
                        'Discard',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0,
                          fontSize: 18
                        ),
                      )
                    )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}