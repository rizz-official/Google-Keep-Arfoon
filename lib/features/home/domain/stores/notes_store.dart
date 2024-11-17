import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_keep_arfoon/features/create_note/domain/models/notes_model.dart';

class NotesStore extends Cubit<List<Notes>> {
  NotesStore() : super(const []);
  setNotesList(List<Notes> notesList) => emit(notesList);
}
