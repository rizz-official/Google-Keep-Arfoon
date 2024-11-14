import 'package:flutter/material.dart';
import 'package:google_keep_arfoon/utlis/constants/colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const CustomFloatingActionButton({
    super.key,
    required this.onPressed,
    this.icon = Icons.add,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: GoogleKeepColors.floatingButtonColor,
      child: Icon(
        icon,
        color: GoogleKeepColors.white,
      ),
    );
  }
}
