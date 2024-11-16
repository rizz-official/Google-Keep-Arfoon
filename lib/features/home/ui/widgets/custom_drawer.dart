import 'package:flutter/material.dart';
import 'package:google_keep_arfoon/utlis/constants/colors.dart';
import 'package:google_keep_arfoon/utlis/constants/sizes.dart';
import '../../../../utlis/theme/text_theme.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.isWeb,this.onTapEdit});
  final bool isWeb;
  final VoidCallback? onTapEdit;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: GoogleKeepColors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isWeb)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Row(
                  children: [
                    const Icon(
                      Icons.lightbulb_outline,
                      size: 28,
                      color: GoogleKeepColors.yellow,
                    ),
                    const SizedBox(width: GoogleKeepSizes.space12px),
                    Text(
                      'Google Keep',
                      style: GoogleKeepTextTheme().bodyRegular.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: GoogleKeepColors.blue,
                          ),
                    ),
                  ],
                ),
              ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: GoogleKeepColors.lightBlue),
              child: ListTile(
                hoverColor: null,
                splashColor: Colors.transparent,
                leading: const Icon(Icons.lightbulb_outline),
                title: Text('Notes',
                    style: GoogleKeepTextTheme()
                        .bodyRegular
                        .copyWith(fontWeight: FontWeight.w500)),
                onTap: () {
                  // Handle navigation or state change
                },
              ),
            ),
            const Divider(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                children: [
                  Text('Labels',
                      style: GoogleKeepTextTheme()
                          .bodyRegular
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 14)),
                  const Spacer(),
                  GestureDetector(
                    onTap: onTapEdit,
                    child: Text('Edit     ',
                        style: GoogleKeepTextTheme().bodyRegular.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 14)),
                  )
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.label_outline),
              title: Text('Dummy', style: GoogleKeepTextTheme().bodyRegular),
              onTap: () {
                // Handle label selection
              },
            ),
            ListTile(
              leading: const Icon(Icons.label_outline),
              title: Text('Google', style: GoogleKeepTextTheme().bodyRegular),
              onTap: () {
                // Handle label selection
              },
            ),
            ListTile(
              leading: const Icon(Icons.label_outline),
              title: Text('School', style: GoogleKeepTextTheme().bodyRegular),
              onTap: () {
                // Handle label selection
              },
            ),
            ListTile(
              leading: const Icon(Icons.label_outline),
              title: Text('Work', style: GoogleKeepTextTheme().bodyRegular),
              onTap: () {
                // Handle label selection
              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: Text('Create new label',
                  style: GoogleKeepTextTheme().bodyRegular),
              onTap: () {
                // Handle creating a new label
              },
            ),
          ],
        ),
      ),
    );
  }
}
