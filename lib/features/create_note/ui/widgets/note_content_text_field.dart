import 'package:flutter/material.dart';

import '../../../../utlis/constants/colors.dart';
import '../../../../utlis/theme/text_theme.dart';

class NoteContentTextField extends StatelessWidget {
  const NoteContentTextField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: controller,
        maxLines: null,
        expands: true,
        textCapitalization: TextCapitalization.sentences,
        maxLength: 5000,
        style: const TextStyle(
          fontSize: 16,
          color: GoogleKeepColors.dark80,
        ),
        decoration: InputDecoration(
          hintText: 'Note',
          hintStyle:
              GoogleKeepTextTheme().bodyRegular.copyWith(color: Colors.grey),
          border: InputBorder.none,
          counterText: '',
        ),
      ),
    );
  }
}
