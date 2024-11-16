import 'package:fpdart/fpdart.dart';
import '../../../../utlis/helper/database_helper.dart';
import '../../../create_note/domain/models/notes_model.dart';
import '../../domain/failure/fetch_notes_failure.dart';
import '../../domain/repositories/notes_repository.dart';
import '../../../label/domain/models/label_model.dart';

class LocalStorageRepository implements NotesRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  @override
  Future<Either<FetchNotesFailure, List<Notes>>> fetchNotes() async {
    try {
      final db = await _dbHelper.database;
      final result = await db.query('notes');

      final notesList = result.map((row) {
        return Notes(
          id: row['id'] as int,
          title: row['title'] as String,
          noteContent: row['content'] as String,
          label: (row['labels'] as String)
              .split(',')
              .map((labelTitle) => Label(labelTitle: labelTitle))
              .toList(),
        );
      }).toList();
      return right(notesList);
    } catch (e) {
      return left(
          FetchNotesFailure(error: 'Failed to fetch notes: ${e.toString()}'));
    }
  }
}
