import 'package:flutter/material.dart';
import 'package:google_keep_arfoon/utlis/constants/colors.dart';
import 'package:google_keep_arfoon/utlis/theme/text_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onMenuTap;
  final VoidCallback onGridViewToggle;
  final bool isGridView;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.onMenuTap,
    required this.onGridViewToggle,
    required this.isGridView,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: GoogleKeepColors.white,
      scrolledUnderElevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.black),
        onPressed: onMenuTap,
      ),
      title: Text(
        title,
        style: GoogleKeepTextTheme()
            .bodyRegular
            .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: onGridViewToggle,
          icon: isGridView
              ? const Icon(Icons.grid_view)
              : const Icon(Icons.splitscreen),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
