import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_keep_arfoon/features/home/ui/widgets/multi_column_list.dart';
import 'package:google_keep_arfoon/features/home/ui/widgets/single_column_list.dart';
import '../../../utlis/constants/colors.dart';
import '../../../utlis/constants/text_string.dart';
import 'home_cubit.dart';
import 'home_state.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_drawer.dart';
import 'widgets/custom_floating_action_button.dart';
import 'widgets/drawer_content.dart';
import 'widgets/empty_state_content.dart';

class HomePage extends StatefulWidget {
  final HomeCubit cubit;
  const HomePage({super.key, required this.cubit});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  HomeCubit get cubit => widget.cubit;
  @override
  void initState() {
    cubit.fetchLabels();
    cubit.fetchNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        cubit.initializePlatform(constraints.maxWidth);
        return BlocBuilder<HomeCubit, HomeState>(
          bloc: cubit,
          builder: (context, state) {
            return Scaffold(
              key: cubit.key,
              backgroundColor: GoogleKeepColors.white,
              appBar: CustomAppBar(
                isGridView: state.isGridView,
                onGridViewToggle: cubit.toggleView,
                title: GooglekeepTexts.appName,
                onMenuTap: cubit.onMenuTap,
              ),
              body: Row(
                children: [
                  DrawerContent(
                    isWeb: state.isWeb,
                    isDrawerVisible: state.isDrawerVisible,
                    labels: state.labelsList,
                    onEditTap: cubit.onEditLabelsTap,
                  ),
                  state.notesList.isEmpty
                      ? EmptyStateContent(isWeb: state.isWeb)
                      : state.isGridView
                          ? SingleColumnList(list: state.notesList)
                          : MultiColumnList(
                              isWeb: state.isWeb,
                              list: state.notesList,
                            )
                ],
              ),
              drawer: state.isWeb
                  ? null
                  : CustomDrawer(
                      isWeb: state.isWeb,
                      onTapEdit: cubit.onEditLabelsTap,
                      labels: state.labelsList,
                    ),
              floatingActionButton: CustomFloatingActionButton(
                onPressed: cubit.onAddNoteTap,
              ),
            );
          },
        );
      },
    );
  }
}
