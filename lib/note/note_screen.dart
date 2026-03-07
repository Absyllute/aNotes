import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
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