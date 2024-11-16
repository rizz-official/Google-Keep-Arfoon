import 'package:flutter/material.dart';

import '../../../../utlis/theme/text_theme.dart';

class EditLabelCard extends StatelessWidget {
  const EditLabelCard({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.add),
        ),
        Text(
          'Create new label',
          style: GoogleKeepTextTheme()
              .bodyRegular
              .copyWith(color: Colors.grey),
        )
      ],
    );
  }
}
