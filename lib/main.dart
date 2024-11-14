import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_keep_arfoon/utlis/constants/text_string.dart';
import 'features/create_note/create_note_cubit.dart';
import 'features/create_note/create_note_initial_params.dart';
import 'features/create_note/create_note_navigator.dart';
import 'features/home/ui/home_cubit.dart';
import 'features/home/ui/home_initial_params.dart';
import 'features/home/ui/home_navigator.dart';
import 'features/home/ui/home_page.dart';
import 'navigation/app_navigator.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<HomeNavigator>(HomeNavigator());
  getIt.registerFactoryParam<HomeCubit, HomeInitialParams, dynamic>(
    (params, _) => HomeCubit(
      params,
    ),
  );
  getIt.registerSingleton<CreateNoteNavigator>(CreateNoteNavigator());
  getIt.registerFactoryParam<CreateNoteCubit, CreateNoteInitialParams, dynamic>(
    (params, _) => CreateNoteCubit(
      params,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: GooglekeepTexts.appName,
      navigatorKey: AppNavigator.navigatorKey,
      debugShowCheckedModeBanner: false,
      home: HomePage(
        cubit: getIt(
          param1: const HomeInitialParams(),
        ),
      ),
    );
  }
}
