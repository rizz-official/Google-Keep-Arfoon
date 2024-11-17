import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_keep_arfoon/features/create_note/domain/models/notes_model.dart';
import 'package:google_keep_arfoon/features/create_note/domain/use_cases/add_new_note_use_case.dart';
import 'package:google_keep_arfoon/features/label/domain/models/label_model.dart';
import 'create_note_initial_params.dart';
import 'create_note_state.dart';

class CreateNoteCubit extends Cubit<CreateNoteState> {
  final CreateNoteInitialParams initialParams;
  final AddNewNoteUseCase _addNewNoteUseCase;
  final _titleController = TextEditingController();
  final _noteContentController = TextEditingController();
  CreateNoteCubit(
    this.initialParams,
    this._addNewNoteUseCase,
  ) : super(CreateNoteState.initial(initialParams: initialParams));

  TextEditingController get titleController => _titleController;
  TextEditingController get noteContentController => _noteContentController;

  Future<void> saveNote() async {
    _addNewNoteUseCase.addNote(
      Notes(
        id: DateTime.now().millisecond,
        title: titleController.text,
        noteContent: noteContentController.text,
        label: [Label(id: DateTime.now().microsecondsSinceEpoch, name: 'Work')],
      ),
    );
  }
}
