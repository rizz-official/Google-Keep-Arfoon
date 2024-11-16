import 'package:flutter/material.dart';
import '../../../../utlis/constants/colors.dart';
import '../../../../utlis/theme/text_theme.dart';

class ExistingLabelCard extends StatelessWidget {
  const ExistingLabelCard({
    super.key,
    this.controller,
    required this.isEditExistingLabel,
    required this.titleLabel,
    this.onDeleteIcon,
    this.onTickIcon,
    this.onEditIcon,
  });
  final TextEditingController? controller;
  final bool isEditExistingLabel;
  final String titleLabel;
  final VoidCallback? onDeleteIcon;
  final VoidCallback? onTickIcon;
  final VoidCallback? onEditIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      leading: IconButton(
        onPressed: isEditExistingLabel ? onDeleteIcon : () {},
        icon: Icon(
          isEditExistingLabel ? Icons.delete_rounded : Icons.label_outline,
          color: GoogleKeepColors.dark90,
        ),
      ),
      title: isEditExistingLabel
          ? TextField(
              controller: controller,
              textCapitalization: TextCapitalization.sentences,
              style: const TextStyle(
                fontSize: 16,
                color: GoogleKeepColors.dark80,
              ),
              decoration: InputDecoration(
                hintStyle: GoogleKeepTextTheme()
                    .bodyRegular
                    .copyWith(color: Colors.grey),
                border: InputBorder.none,
                counterText: '',
              ),
            )
          : Text(
              titleLabel,
              style: GoogleKeepTextTheme()
                  .bodyRegular
                  .copyWith(fontWeight: FontWeight.w500),
            ),
      trailing: IconButton(
        icon: Icon(
          isEditExistingLabel ? Icons.check : Icons.edit,
          color: GoogleKeepColors.dark90,
        ),
        onPressed: isEditExistingLabel ? onTickIcon : onEditIcon,
      ),
    );
  }
}
