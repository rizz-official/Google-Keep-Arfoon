import 'package:flutter/material.dart';

import '../../../../utlis/constants/colors.dart';
import '../../../../utlis/theme/text_theme.dart';

class EditLabelTextField extends StatelessWidget {
  const EditLabelTextField(
      {super.key, this.controller, this.onClose, this.onTick});
  final TextEditingController? controller;
  final VoidCallback? onClose;
  final VoidCallback? onTick;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Row(
          children: [
            IconButton(onPressed: onClose, icon: const Icon(Icons.close)),
            Expanded(
              child: TextField(
                controller: controller,
                textCapitalization: TextCapitalization.sentences,
                style: const TextStyle(
                  fontSize: 16,
                  color: GoogleKeepColors.dark80,
                ),
                decoration: InputDecoration(
                  hintText: 'Create new label',
                  hintStyle: GoogleKeepTextTheme()
                      .bodyRegular
                      .copyWith(color: Colors.grey),
                  border: InputBorder.none,
                  counterText: '',
                ),
              ),
            ),
            IconButton(icon: const Icon(Icons.check), onPressed: onTick),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
