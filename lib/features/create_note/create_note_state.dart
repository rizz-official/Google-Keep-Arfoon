import 'create_note_initial_params.dart';

class CreateNoteState {
  const CreateNoteState();

  factory CreateNoteState.initial(
          {required CreateNoteInitialParams initialParams}) =>
      const CreateNoteState();

  CreateNoteState copyWith() => const CreateNoteState();
}
