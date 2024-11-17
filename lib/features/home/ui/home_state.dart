import 'package:google_keep_arfoon/features/create_note/domain/models/notes_model.dart';
import 'package:google_keep_arfoon/features/label/domain/models/label_model.dart';

import 'home_initial_params.dart';

class HomeState {
  final bool isWeb;
  final bool isDrawerVisible;
  final List<Notes> notesList;
  final List<Label> labelsList;
  final bool isLoading;
  final String? error;
  final bool isGridView;

  const HomeState({
    required this.isWeb,
    required this.isDrawerVisible,
    required this.notesList,
    required this.isLoading,
    this.error,
    required this.isGridView,
    required this.labelsList,
  });

  factory HomeState.initial({required HomeInitialParams initialParams}) =>
      const HomeState(
        isWeb: false,
        isDrawerVisible: true,
        notesList: [],
        isLoading: false,
        error: null,
        isGridView: true,
        labelsList: [],
      );

  HomeState copyWith({
    bool? isWeb,
    bool? isDrawerVisible,
    List<Notes>? notesList,
    bool? isLoading,
    String? error,
    bool? isGridView,
    List<Label>? labelsList,
  }) =>
      HomeState(
        isWeb: isWeb ?? this.isWeb,
        isDrawerVisible: isDrawerVisible ?? this.isDrawerVisible,
        notesList: notesList ?? this.notesList,
        isLoading: isLoading ?? this.isLoading,
        error: error,
        isGridView: isGridView ?? this.isGridView,
        labelsList: labelsList?? this.labelsList,
      );
}
