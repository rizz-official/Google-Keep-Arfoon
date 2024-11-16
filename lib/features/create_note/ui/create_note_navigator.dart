import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../../navigation/app_navigator.dart';
import 'create_note_initial_params.dart';
import 'create_note_page.dart';

class CreateNoteNavigator {}

mixin CreateNoteRoute {
  openCreateNote(CreateNoteInitialParams initialParams) {
    navigator.push(
      CreateNotePage(cubit: getIt(param1: initialParams)),
    );
  }

  AppNavigator get navigator;

  BuildContext get context;
}
