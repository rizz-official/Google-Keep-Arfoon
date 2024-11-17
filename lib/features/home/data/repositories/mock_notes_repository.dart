import 'package:fpdart/fpdart.dart';
import 'package:google_keep_arfoon/features/create_note/domain/models/notes_model.dart';
import 'package:google_keep_arfoon/features/home/domain/failure/fetch_notes_failure.dart';
import 'package:google_keep_arfoon/features/home/domain/repositories/notes_repository.dart';

import '../../../../utlis/data/fake_notes_data.dart';

class MockNotesRepository implements NotesRepository {
  @override
  Future<Either<FetchNotesFailure, List<Notes>>> getNotes() async {
    try {
      final notes = getFakeNotes();
      return Right(notes);
    } catch (e) {
      return Left(FetchNotesFailure(error: e.toString()));
    }
  }
}
