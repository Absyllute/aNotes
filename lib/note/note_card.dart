import 'dart:ui';

import 'package:anotes/note/note_data.dart';
import 'package:anotes/note/on-note-hold/note_option.dart';
import 'package:anotes/themes/colours.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.noteData,
    required this.onTap,
    required this.onDelete
  });

  final NoteData noteData;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  

  @override
  Widget build(BuildContext context) {

    List<NoteOption> noteOptions = [
    NoteOption(
      optionIcon: Icon(Icons.delete_forever_rounded, color: Colors.white),
      optionText: 'Delete Note',
      optionFunction: onDelete
    ),

    NoteOption(
      optionIcon: Icon(Icons.edit, color: Colors.white),
      optionText: 'Edit Note',
      optionFunction: () {
        Navigator.pop(context);
        onTap();
      }
    ),
  ];

    return GestureDetector(
      onTap: onTap,
      onLongPress: () {
        showDialog(
          context: context,
          useSafeArea: false,
          barrierColor: Colors.transparent,
          builder: (context) {
            return Stack(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: BackdropFilter(
                    filter: ImageFilter.blur( sigmaX: 3, sigmaY: 3 ),
                    child: Container( color: Colors.black.withAlpha(10) ),
                  ),
                ),

                Center(
                  child: Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colours.primaryColour,
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...noteOptions
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },

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