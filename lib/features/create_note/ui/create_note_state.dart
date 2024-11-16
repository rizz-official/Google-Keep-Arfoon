import 'package:google_keep_arfoon/features/create_note/domain/models/notes_model.dart';

import 'create_note_initial_params.dart';

class CreateNoteState {
  final String title;
  final String noteContent;
  final List<Notes> notes;
  final String? error;
  final bool success;
  const CreateNoteState({
    required this.title,
    required this.noteContent,
    required this.notes,
    this.error,
    required this.success,
  });

  factory CreateNoteState.initial(
          {required CreateNoteInitialParams initialParams}) =>
      const CreateNoteState(
        title: '',
        noteContent: '',
        notes: [],
        error: null,
        success: false,
      );

  CreateNoteState copyWith({
    String? title,
    String? noteContent,
    List<Notes>? notes,
    String? error,
    bool? success,
  }) =>
      CreateNoteState(
        title: title ?? this.title,
        noteContent: noteContent ?? this.noteContent,
        notes: notes ?? this.notes,
        error: error,
        success: success ?? this.success,
      );
}
