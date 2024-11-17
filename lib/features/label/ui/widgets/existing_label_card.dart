import 'package:flutter/material.dart';
import 'package:google_keep_arfoon/features/label/domain/models/label_model.dart';
import '../../../../utlis/theme/text_theme.dart';

class ExistingLabelCard extends StatelessWidget {
  const ExistingLabelCard({
    super.key,
    this.controller,
    required this.label,
  });
  final TextEditingController? controller;
  final Label label;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.label_outline,
        ),
      ),
      title: Text(
        label.name,
        style: GoogleKeepTextTheme()
            .bodyRegular
            .copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}
