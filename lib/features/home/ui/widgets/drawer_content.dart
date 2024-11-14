import 'package:flutter/material.dart';
import 'package:google_keep_arfoon/features/home/ui/widgets/custom_drawer.dart';

class DrawerContent extends StatelessWidget {
  final bool isWeb;
  final bool isDrawerVisible;

  const DrawerContent(
      {super.key, required this.isWeb, required this.isDrawerVisible});

  @override
  Widget build(BuildContext context) {
    if (isWeb && isDrawerVisible) {
      return SizedBox(
        width: 250,
        child: CustomDrawer(isWeb: isWeb),
      );
    } else {
      return const SizedBox
          .shrink(); // Empty container for when the drawer is hidden on the web
    }
  }
}
