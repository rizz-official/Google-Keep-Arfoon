import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_keep_arfoon/features/create_note/ui/create_note_initial_params.dart';
import 'package:google_keep_arfoon/features/home/ui/home_navigator.dart';
import 'package:google_keep_arfoon/features/label/ui/label_initial_params.dart';
import 'package:google_keep_arfoon/features/home/domain/repositories/notes_repository.dart';
import 'home_initial_params.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeInitialParams initialParams;
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  final HomeNavigator navigator;
  final NotesRepository notesRepository;

  HomeCubit(this.initialParams, this.navigator, this.notesRepository)
      : super(HomeState.initial(initialParams: initialParams));

  void initializePlatform(double width) {
    emit(state.copyWith(isWeb: width > 600));
  }

  void toggleView() {
    emit(state.copyWith(isGridView: !state.isGridView));
  }

  void onMenuTap() {
    if (state.isWeb) {
      emit(state.copyWith(isDrawerVisible: !state.isDrawerVisible));
    } else {
      key.currentState?.openDrawer();
    }
  }

  void onAddNoteTap() {
    navigator.openCreateNote(const CreateNoteInitialParams());
  }

  void onLabelEditTap() {
    navigator.openLabel(const LabelInitialParams());
  }

  Future<void> fetchNotes() async {
    final result = await notesRepository.getNotes();
    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          error: failure.error,
        ));
      },
      (notes) {
        emit(state.copyWith(
          isLoading: false,
          notesList: notes,
        ));
      },
    );
  }
}
