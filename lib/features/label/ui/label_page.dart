import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_keep_arfoon/features/label/ui/label_state.dart';
import 'package:google_keep_arfoon/features/label/ui/widgets/existing_label_card.dart';
import 'package:google_keep_arfoon/features/label/ui/widgets/edit_label_card.dart';
import 'package:google_keep_arfoon/features/label/ui/widgets/edit_label_text_field.dart';
import 'package:google_keep_arfoon/utlis/constants/colors.dart';
import 'package:google_keep_arfoon/utlis/constants/text_string.dart';
import '../../../utlis/theme/text_theme.dart';
import 'label_cubit.dart';

class LabelPage extends StatefulWidget {
  final LabelCubit cubit;

  const LabelPage({
    super.key,
    required this.cubit,
  });

  @override
  State<LabelPage> createState() => _LabelPageState();
}

class _LabelPageState extends State<LabelPage> {
  LabelCubit get cubit => widget.cubit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GoogleKeepColors.white,
      appBar: AppBar(
        backgroundColor: GoogleKeepColors.white,
        title: Text(
          GooglekeepTexts.editLabels,
          style: GoogleKeepTextTheme().bodyRegular.copyWith(
                fontSize: 17,
                color: Colors.black,
              ),
        ),
      ),
      body: BlocBuilder<LabelCubit, LabelState>(
        bloc: cubit,
        builder: (context, state) {
          return Column(
            children: [
              state.isCreateLabel
                  ? EditLabelTextField(
                      controller: cubit.labelController,
                      onClose: cubit.onCloseIconTap,
                      onTick: cubit.onTickIconTap,
                    )
                  : GestureDetector(
                      onDoubleTap: cubit.onCreateLabelTap,
                      child: EditLabelCard(
                        onPressed: cubit.onCreateLabelTap,
                      ),
                    ),
              ExistingLabelCard(
                isEditExistingLabel: state.isEditExistingLabel,
                titleLabel: 'Work',
                onEditIcon: cubit.onEditLabelTap,
                onTickIcon: cubit.onTickIconTap,
              ),
            ],
          );
        },
      ),
    );
  }
}
