import 'package:flutter/material.dart';
import 'package:google_keep_arfoon/features/create_note/domain/models/notes_model.dart';
import '../../../../utlis/constants/colors.dart';
import '../../../../utlis/constants/sizes.dart';
import '../../../../utlis/theme/text_theme.dart';

class SingleColumnList extends StatelessWidget {
  const SingleColumnList({super.key, required this.list});
  final List<Notes> list;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final notes = list;
          return Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(bottom: 8, left: 12, right: 12),
            decoration: BoxDecoration(
              color: GoogleKeepColors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notes[index].title,
                  style: GoogleKeepTextTheme()
                      .bodyLargeMedium
                      .copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: GoogleKeepSizes.space6px,
                ),
                Text(
                  notes[index].noteContent,
                  style:
                      GoogleKeepTextTheme().bodyRegular.copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: GoogleKeepSizes.space12px,
                ),
                SizedBox(
                  height: 24,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: list[index].label.length,
                      itemBuilder: (context, index) {
                        final labels = list[index].label;
                        return Container(
                          padding: const EdgeInsets.all(4),
                          margin: const EdgeInsets.only(left: 4),
                          decoration: BoxDecoration(
                              color: const Color(0xC7DBDBE5),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            labels[index].name,
                            style: GoogleKeepTextTheme()
                                .bodyRegular
                                .copyWith(fontSize: 12),
                          ),
                        );
                      }),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
