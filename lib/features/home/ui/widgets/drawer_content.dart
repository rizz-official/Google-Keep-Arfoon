import 'package:flutter/material.dart';
import 'package:google_keep_arfoon/features/home/ui/widgets/custom_drawer.dart';
import 'package:google_keep_arfoon/features/label/domain/models/label_model.dart';

class DrawerContent extends StatelessWidget {
  final bool isWeb;
  final bool isDrawerVisible;
  final List<Label> labels;
  final VoidCallback onEditTap;

  const DrawerContent(
      {super.key,
      required this.isWeb,
      required this.isDrawerVisible,
      required this.labels,
      required this.onEditTap});

  @override
  Widget build(BuildContext context) {
    if (isWeb && isDrawerVisible) {
      return SizedBox(
        width: 250,
        child: CustomDrawer(
          isWeb: isWeb,
          labels: labels,
          onTapEdit: onEditTap,
        ),
      );
    } else {
      return const SizedBox
          .shrink(); // Empty container for when the drawer is hidden on the web
    }
  }
}
