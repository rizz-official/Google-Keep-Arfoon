import '../domain/models/label_model.dart';
import 'label_initial_params.dart';

class LabelState {
  final List<Label> labels;
  final String labelTitle;
  final bool isCreatingLabel;
  final bool isEditExistingLabel;
  final String? error;

  const LabelState({
    required this.labels,
    required this.labelTitle,
    required this.isCreatingLabel,
    required this.isEditExistingLabel,
    this.error,
  });

  factory LabelState.initial({required LabelInitialParams initialParams}) {
    return const LabelState(
      labels: [],
      labelTitle: '',
      isCreatingLabel: false,
      isEditExistingLabel: false,
      error: null,
    );
  }

  LabelState copyWith({
    List<Label>? labels,
    String? labelTitle,
    bool? isCreatingLabel,
    bool? isEditExistingLabel,
    String? error
  }) =>
     LabelState(
      labels: labels ?? this.labels,
      labelTitle: labelTitle ?? this.labelTitle,
      isCreatingLabel: isCreatingLabel ?? this.isCreatingLabel,
      isEditExistingLabel: isEditExistingLabel ?? this.isEditExistingLabel,
      error: error,
    );
}
