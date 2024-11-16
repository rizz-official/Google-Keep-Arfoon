import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'label_initial_params.dart';
import 'label_state.dart';

class LabelCubit extends Cubit<LabelState> {
  final LabelInitialParams initialParams;
  final _labelController = TextEditingController();

  LabelCubit(this.initialParams)
      : super(LabelState.initial(initialParams: initialParams));
  TextEditingController get labelController => _labelController;


  void onCreateLabelTap() {
    emit(state.copyWith(isCreateLabel: true));
  }

  void onCloseIconTap() {
    emit(state.copyWith(isCreateLabel: false));
  }

  void onTickIconTap() {
    emit(state.copyWith(isCreateLabel: false,isEditExistingLabel: false));
  }

  void onEditLabelTap() {
    emit(state.copyWith(isEditExistingLabel: true));
  }
}
