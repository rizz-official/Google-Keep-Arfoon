import 'package:fpdart/fpdart.dart';
import 'package:sqflite/sqflite.dart';
import '../../../../utlis/helper/database_helper.dart';
import '../../domain/failures/create_note_failure.dart';
import '../../domain/models/notes_model.dart';
import '../../domain/repositories/note_repository.dart';

class CreateNoteRepository implements NoteRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  @override
  Future<Either<CreateNoteFailure, bool>> createNote(Notes note) async {
    try {
      final db = await _dbHelper.database;
      final labelsString =
      note.label.map((label) => label.labelTitle).join(',');

      // Insert note into the database
      await db.insert(
        'notes',
        {
          'title': note.title,
          'content': note.noteContent,
          'labels': labelsString,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return right(true);
    } catch (e) {
      // On failure, return the error
      return left(CreateNoteFailure(error: 'Failed to create note: ${e.toString()}'));
    }
  }
}
