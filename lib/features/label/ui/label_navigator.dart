import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../../navigation/app_navigator.dart';
import 'label_initial_params.dart';
import 'label_page.dart';

class LabelNavigator {}

mixin LabelRoute {
openLabel(LabelInitialParams initialParams) {
navigator.push(
LabelPage(cubit: getIt(param1: initialParams)),
);
}

AppNavigator get navigator;

BuildContext get context;
}
