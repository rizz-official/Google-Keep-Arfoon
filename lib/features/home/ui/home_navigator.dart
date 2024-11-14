import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../../navigation/app_navigator.dart';
import 'home_initial_params.dart';
import 'home_page.dart';

class HomeNavigator {}

mixin HomeRoute {
  openHome(HomeInitialParams initialParams) {
    navigator.push(
      HomePage(cubit: getIt(param1: initialParams)),
    );
  }

  AppNavigator get navigator;

  BuildContext get context;
}
