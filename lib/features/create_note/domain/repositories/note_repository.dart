import '../failures/create_note_failure.dart';
import '../models/notes_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class NoteRepository {
  Future<Either<CreateNoteFailure, bool>> createNote(Notes note);
}
