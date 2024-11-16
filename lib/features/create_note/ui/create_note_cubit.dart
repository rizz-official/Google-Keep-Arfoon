import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_keep_arfoon/features/create_note/domain/models/notes_model.dart';
import 'package:google_keep_arfoon/features/create_note/domain/repositories/note_repository.dart';
import 'create_note_initial_params.dart';
import 'create_note_state.dart';

class CreateNoteCubit extends Cubit<CreateNoteState> {
  final CreateNoteInitialParams initialParams;
  final NoteRepository notesRepository;

  CreateNoteCubit(
    this.initialParams,
    this.notesRepository,
  ) : super(CreateNoteState.initial(initialParams: initialParams));

  void updateTitle(String title) {
    emit(state.copyWith(title: title));
  }

  void updateNoteContent(String noteContent) {
    emit(state.copyWith(noteContent: noteContent));
  }

  Future<void> saveNote() async {
    final note = Notes(
      id: DateTime.now().millisecondsSinceEpoch,
      title: state.title,
      noteContent: state.noteContent,
      label: const [],
    );

    final result = await notesRepository.createNote(note);

    result.fold(
      (failure) {
        emit(state.copyWith(error: 'Failed to save note.'));
      },
      (success) {
        emit(state.copyWith(success: true));
      },
    );
  }
}
