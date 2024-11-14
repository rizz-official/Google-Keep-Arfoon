import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'create_note_cubit.dart';
import 'create_note_state.dart';

class CreateNotePage extends StatefulWidget {
  final CreateNoteCubit cubit;

  const CreateNotePage({
    super.key,
    required this.cubit,
  });

  @override
  State<CreateNotePage> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNotePage> {
  CreateNoteCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SizedBox(),
    );
  }
}
