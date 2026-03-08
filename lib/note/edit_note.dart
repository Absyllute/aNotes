import 'package:anotes/note/note_data.dart';
import 'package:anotes/note/note_screen.dart';
import 'package:flutter/material.dart';

class EditNote extends StatefulWidget {
  const EditNote({
    super.key,
    required this.index,
    required this.noteData
  });

  final NoteData noteData;
  final int index;

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {

  late TextEditingController _noteTitleController;
  late TextEditingController _noteContentController;

  @override
    void initState() { 
      super.initState();
      _noteTitleController = TextEditingController(
        text: widget.noteData.noteTitle
      );

      _noteContentController = TextEditingController(
        text: widget.noteData.noteContent
      );
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

                controller: _noteTitleController,
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
                  controller: _noteContentController,

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
                        if (_noteTitleController.text.isNotEmpty && _noteContentController.text.isNotEmpty) {

                          savedNotesBox.put(
                            widget.index,
                            NoteData(
                              noteTitle: _noteTitleController.text,
                              noteContent: _noteContentController.text
                            )
                          );
                        }
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Save Edits',
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
                        Navigator.pop(context);
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