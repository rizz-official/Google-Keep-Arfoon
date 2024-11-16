import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_keep_arfoon/features/create_note/ui/create_note_state.dart';
import 'package:google_keep_arfoon/features/create_note/ui/widgets/note_content_text_field.dart';
import 'package:google_keep_arfoon/features/create_note/ui/widgets/title_text_field.dart';
import 'package:google_keep_arfoon/utlis/constants/colors.dart';
import 'package:google_keep_arfoon/utlis/constants/sizes.dart';
import 'create_note_cubit.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GoogleKeepColors.white,
      appBar: AppBar(
        backgroundColor: GoogleKeepColors.white,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.label_outline),
            onPressed: () {},
          ),
          BlocBuilder<CreateNoteCubit, CreateNoteState>(
              bloc: cubit,
              builder: (context, state) {
                return IconButton(
                  icon: const Icon(Icons.save_as_outlined),
                  onPressed: () async {
                    await cubit.saveNote();

                    if (state.success) {
                      Navigator.of(context).pop();
                    } else if (state.error != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.error!),
                        ),
                      );
                    }
                  },
                );
              }),
          const SizedBox(
            width: GoogleKeepSizes.space8px,
          )
        ],
      ),
      body: BlocBuilder<CreateNoteCubit, CreateNoteState>(
          bloc: cubit,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleTextField(
                    onChanged: cubit.updateTitle,
                  ),
                  NoteContentTextField(
                    onChanged: cubit.updateNoteContent,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
