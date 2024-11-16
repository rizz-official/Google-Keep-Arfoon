import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    cubit.onInit();
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
                title: GooglekeepTexts.appName,
                onMenuTap: cubit.onMenuTap,
              ),
              body: Row(
                children: [
                  DrawerContent(
                    isWeb: state.isWeb,
                    isDrawerVisible: state.isDrawerVisible,
                  ),
                  state.notesList.isEmpty
                      ? EmptyStateContent(isWeb: state.isWeb)
                      : ListView.builder(
                          itemCount: state.notesList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 20,
                              decoration:
                                  BoxDecoration(border: Border.all(width: 2)),
                              child: Text(state.notesList[index].title),
                            );
                          }),
                ],
              ),
              drawer: state.isWeb
                  ? null
                  : CustomDrawer(
                      isWeb: state.isWeb,
                      onTapEdit: cubit.onLabelEditTap,
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
