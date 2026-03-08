import 'package:anotes/note/note_data.dart';
import 'package:anotes/themes/colours.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.noteData,
    required this.onTap
  });

  final NoteData noteData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colours.primaryColour,
            borderRadius: BorderRadius.circular(24)
          ),
        
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                noteData.noteTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis
                ),
              ),
        
              Divider(),
        
              Expanded(
                child: Text(
                  noteData.noteContent,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}