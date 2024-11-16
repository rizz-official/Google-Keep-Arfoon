import 'package:fpdart/fpdart.dart';
import 'package:google_keep_arfoon/features/create_note/domain/models/notes_model.dart';
import '../failure/fetch_notes_failure.dart';

abstract class NotesRepository {
  Future<Either<FetchNotesFailure, List<Notes>>> fetchNotes();
}