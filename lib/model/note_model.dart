import 'package:hive_flutter/adapters.dart';
part 'note_model.g.dart';

@HiveType(typeId: 2)
enum NoteType {
  @HiveField(0)
  title,

  @HiveField(1)
  description,
}

@HiveType(typeId: 1)
class NoteModel {
  @HiveField(0)
  String? id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  NoteModel({required this.title, required this.description}) {
    id = DateTime.now().microsecondsSinceEpoch.toString();
  }
}
