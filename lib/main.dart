import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_keep_arfoon/features/label/data/mock_labels_repository.dart';
import 'package:google_keep_arfoon/features/label/domain/repository/labels_repository.dart';
import 'package:google_keep_arfoon/features/label/ui/label_cubit.dart';
import 'package:google_keep_arfoon/features/label/ui/label_initial_params.dart';
import 'package:google_keep_arfoon/features/label/ui/label_navigator.dart';
import 'package:google_keep_arfoon/utlis/constants/text_string.dart';
import 'features/create_note/ui/create_note_cubit.dart';
import 'features/create_note/ui/create_note_initial_params.dart';
import 'features/create_note/ui/create_note_navigator.dart';
import 'features/home/data/repositories/mock_notes_repository.dart';
import 'features/home/domain/repositories/notes_repository.dart';
import 'features/home/ui/home_cubit.dart';
import 'features/home/ui/home_initial_params.dart';
import 'features/home/ui/home_navigator.dart';
import 'features/home/ui/home_page.dart';
import 'navigation/app_navigator.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<AppNavigator>(AppNavigator());
  getIt.registerSingleton<LabelsRepository>(MockLabelsRepository());
  getIt.registerSingleton<NotesRepository>(MockNotesRepository());
  getIt.registerSingleton<HomeNavigator>(HomeNavigator(getIt()));
  getIt.registerFactoryParam<HomeCubit, HomeInitialParams, dynamic>(
    (params, _) => HomeCubit(
      params,
      getIt(),
      getIt(),
    ),
  );

  getIt.registerSingleton<CreateNoteNavigator>(CreateNoteNavigator());

  getIt.registerFactoryParam<CreateNoteCubit, CreateNoteInitialParams, dynamic>(
    (params, _) => CreateNoteCubit(
      params,
    ),
  );

  getIt.registerSingleton<LabelNavigator>(LabelNavigator());

  getIt.registerFactoryParam<LabelCubit, LabelInitialParams, dynamic>(
    (params, _) => LabelCubit(
      params,
      getIt(),
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
