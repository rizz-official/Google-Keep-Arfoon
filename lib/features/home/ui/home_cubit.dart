import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_keep_arfoon/features/create_note/ui/create_note_initial_params.dart';
import 'package:google_keep_arfoon/features/home/domain/repositories/notes_repository.dart';
import 'package:google_keep_arfoon/features/home/ui/home_navigator.dart';
import 'package:google_keep_arfoon/features/label/ui/label_initial_params.dart';
import 'home_initial_params.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeInitialParams initialParams;
  final NotesRepository _notesRepository;
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  final HomeNavigator navigator;

  HomeCubit(this.initialParams, this.navigator, this._notesRepository)
      : super(HomeState.initial(initialParams: initialParams));

  Future<void> onInit() async {
    emit(state.copyWith(isLoading: true));
    final result = await _notesRepository.fetchNotes();
    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          error: failure.error,
        ));
      },
      (notesList) {
        emit(state.copyWith(
          isLoading: false,
          notesList: notesList,
        ));
      },
    );
  }

  void initializePlatform(double width) {
    emit(state.copyWith(isWeb: width > 600));
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
}
