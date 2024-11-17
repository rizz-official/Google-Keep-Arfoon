import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_keep_arfoon/features/label/domain/repository/labels_repository.dart';
import '../domain/models/label_model.dart';
import 'label_initial_params.dart';
import 'label_state.dart';

class LabelCubit extends Cubit<LabelState> {
  final LabelInitialParams initialParams;
  final _labelController = TextEditingController();
  final LabelsRepository _labelsRepository;

  LabelCubit(this.initialParams, this._labelsRepository)
      : super(LabelState.initial(initialParams: initialParams));
  TextEditingController get labelController => _labelController;
  void onInit() async {
    final labelsList = await _labelsRepository.getLabels();
    labelsList.fold(
      (l) => emit(
        state.copyWith(error: 'Error occurred!'),
      ),
      (r) => emit(
        state.copyWith(
          labels: r,
          error: null,
        ),
      ),
    );
  }

  void onCreateLabelTap() {
    emit(state.copyWith(isCreatingLabel: true));
  }

  void onCloseIconTap() {
    emit(state.copyWith(isCreatingLabel: false));
  }

  void onTickIconTap() async {
    emit(state.copyWith(isCreatingLabel: false, isEditExistingLabel: false));
    final labelsList = await _labelsRepository.addLabel(Label(
        id: DateTime.now().millisecond, name: _labelController.text));
    labelsList.fold(
      (l) => emit(
        state.copyWith(error: 'Error while creating new label!'),
      ),
      (r) {
        _labelController.clear();
        emit(
        state.copyWith(labels: r, error: null, isCreatingLabel: false),
      );
      },
    );
  }

  void onEditLabelTap() {
    emit(state.copyWith(isEditExistingLabel: true));
  }
}
