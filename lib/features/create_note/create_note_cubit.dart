import 'package:flutter_bloc/flutter_bloc.dart';
import 'create_note_initial_params.dart';
import 'create_note_state.dart';

class CreateNoteCubit extends Cubit<CreateNoteState> {
  final CreateNoteInitialParams initialParams;

  CreateNoteCubit(this.initialParams)
      : super(CreateNoteState.initial(initialParams: initialParams));
}
