import 'package:hive_flutter/adapters.dart';

part 'note_data.g.dart';

@HiveType(typeId: 0)
class NoteData {
  const NoteData({
    required this.noteTitle,
    required this.noteContent,
  });

  @HiveField(0)
  final String noteTitle;

  @HiveField(1)
  final String noteContent;
}