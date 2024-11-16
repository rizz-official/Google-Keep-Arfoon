import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_keep_arfoon/features/create_note/data/repositories/create_note_repository.dart';
import 'package:google_keep_arfoon/features/create_note/domain/repositories/note_repository.dart';
import 'package:google_keep_arfoon/features/home/data/repositories/local_storage_repository.dart';
import 'package:google_keep_arfoon/features/home/domain/repositories/notes_repository.dart';
import 'package:google_keep_arfoon/features/label/ui/label_cubit.dart';
import 'package:google_keep_arfoon/features/label/ui/label_initial_params.dart';
import 'package:google_keep_arfoon/features/label/ui/label_navigator.dart';
import 'package:google_keep_arfoon/utlis/constants/text_string.dart';
import 'features/create_note/ui/create_note_cubit.dart';
import 'features/create_note/ui/create_note_initial_params.dart';
import 'features/create_note/ui/create_note_navigator.dart';
import 'features/home/ui/home_cubit.dart';
import 'features/home/ui/home_initial_params.dart';
import 'features/home/ui/home_navigator.dart';
import 'features/home/ui/home_page.dart';
import 'navigation/app_navigator.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<AppNavigator>(AppNavigator());
  getIt.registerSingleton<NoteRepository>(CreateNoteRepository());
  getIt.registerSingleton<NotesRepository>(LocalStorageRepository());
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
      getIt(),
    ),
  );
  getIt.registerSingleton<LabelNavigator>(LabelNavigator());
  getIt.registerFactoryParam<LabelCubit, LabelInitialParams, dynamic>(
    (params, _) => LabelCubit(
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
