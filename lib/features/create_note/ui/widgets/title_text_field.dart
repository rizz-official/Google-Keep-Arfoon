import 'package:flutter/material.dart';
import '../../../../utlis/constants/colors.dart';
import '../../../../utlis/theme/text_theme.dart';

class TitleTextField extends StatelessWidget {
  const TitleTextField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: GoogleKeepTextTheme().bodyMedium.copyWith(
            fontSize: 18,
            color: GoogleKeepColors.dark90,
          ),
      maxLength: 50,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counterText: '',
        hintText: 'Title',
        hintStyle: GoogleKeepTextTheme()
            .bodyRegular
            .copyWith(color: Colors.grey, fontSize: 18),
        border: InputBorder.none,
      ),
    );
  }
}
