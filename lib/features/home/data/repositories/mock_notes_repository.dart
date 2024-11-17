import 'package:fpdart/fpdart.dart';
import 'package:google_keep_arfoon/features/create_note/domain/models/notes_model.dart';
import 'package:google_keep_arfoon/features/home/domain/failure/add_note_failure.dart';
import 'package:google_keep_arfoon/features/home/domain/failure/fetch_notes_failure.dart';
import 'package:google_keep_arfoon/features/home/domain/repositories/notes_repository.dart';

import '../../../../utlis/data/mock_notes_list.dart';

class MockNotesRepository implements NotesRepository {
  final notes = getFakeNotes();
  @override
  Future<Either<FetchNotesFailure, List<Notes>>> getNotes() async {
    try {
      return Right(notes);
    } catch (e) {
      return Left(FetchNotesFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<AddNoteFailure, List<Notes>>> addNewNote(Notes note) async {
    try {
      notes.add(note);
      return right(notes);
    } catch (e) {
      return left(AddNoteFailure(error: e.toString()));
    }
  }
}
