import 'package:flutter/material.dart';
import 'package:google_keep_arfoon/features/create_note/ui/create_note_navigator.dart';
import 'package:google_keep_arfoon/features/label/ui/label_navigator.dart';
import '../../../main.dart';
import '../../../navigation/app_navigator.dart';
import 'home_initial_params.dart';
import 'home_page.dart';

class HomeNavigator with CreateNoteRoute, LabelRoute {
  HomeNavigator(this.navigator);
  @override
  late BuildContext context;
  @override
  AppNavigator navigator;
}

mixin HomeRoute {
  openHome(HomeInitialParams initialParams) {
    navigator.push(
      HomePage(cubit: getIt(param1: initialParams)),
    );
  }

  AppNavigator get navigator;

  BuildContext get context;
}
