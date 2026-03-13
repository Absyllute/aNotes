import 'package:anotes/themes/colours.dart';
import 'package:flutter/material.dart';

class NoteOption extends StatelessWidget {
  const NoteOption({
    super.key,
    required this.optionIcon,
    required this.optionText,
    required this.optionFunction
  });

  final Icon optionIcon;
  final String optionText;
  final VoidCallback optionFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: optionFunction,

      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          
          width: double.infinity,
          constraints: BoxConstraints(maxWidth: 220),
      
          decoration: BoxDecoration(
            color: Colours.secondaryColour,
            borderRadius: BorderRadius.circular(30)
          ),
        
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                optionIcon,
      
                Expanded(
                  child: Center(
                    child: Text(
                      optionText,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  )
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}