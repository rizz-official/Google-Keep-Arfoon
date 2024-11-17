import 'package:fpdart/fpdart.dart';
import 'package:google_keep_arfoon/features/create_note/domain/models/notes_model.dart';
import 'package:google_keep_arfoon/features/home/domain/repositories/notes_repository.dart';

import '../../../home/domain/failure/add_note_failure.dart';
import '../../../home/domain/stores/notes_store.dart';

class AddNewNoteUseCase {
  final NotesRepository _notesRepository;
  final NotesStore _notesStore;
  const AddNewNoteUseCase(this._notesRepository, this._notesStore);
  Future<Either<AddNoteFailure, bool>> addNote(Notes note) {
    return _notesRepository.addNewNote(note).then(
          (value) => value.fold(
            (l) => left(AddNoteFailure(error: l.error)),
            (r) {
              _notesStore.setNotesList(r);
              print(_notesStore.state);
              return right(true);
            },
          ),
        );
  }
}
