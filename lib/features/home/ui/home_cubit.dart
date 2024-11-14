import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_initial_params.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeInitialParams initialParams;
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  HomeCubit(this.initialParams)
      : super(HomeState.initial(initialParams: initialParams));

  void initializePlatform(double width) {
    emit(state.copyWith(isWeb: width > 600));
  }

  void onMenuTap() {
    if (state.isWeb) {
      emit(state.copyWith(isDrawerVisible: !state.isDrawerVisible));
    } else {
      key.currentState?.openDrawer();
    }
  }
}
