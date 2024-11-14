import 'package:flutter/material.dart';
import 'package:google_keep_arfoon/utlis/constants/colors.dart';
import 'package:google_keep_arfoon/utlis/constants/sizes.dart';
import 'package:google_keep_arfoon/utlis/constants/text_string.dart';
import 'package:google_keep_arfoon/utlis/theme/text_theme.dart';

class EmptyStateContent extends StatelessWidget {
  final bool isWeb;
  const EmptyStateContent({super.key, required this.isWeb});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.lightbulb_outline,
            color: isWeb ? GoogleKeepColors.dark30 : GoogleKeepColors.yellow,
            size: 125,
          ),
          const SizedBox(
            height: GoogleKeepSizes.space24px,
          ),
          Center(
            child: Text(
              GooglekeepTexts.emptyNotes,
              style: GoogleKeepTextTheme().bodyRegular.copyWith(
                    color: GoogleKeepColors.lightBlack,
                    fontSize: isWeb ? 20 : 16,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
