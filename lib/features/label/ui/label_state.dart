import 'label_initial_params.dart';

class LabelState {
  final List<String> labels;
  final String labelTitle;
  final bool isCreateLabel;
  final bool isEditExistingLabel;

  const LabelState({
    required this.labels,
    required this.labelTitle,
    required this.isCreateLabel,
    required this.isEditExistingLabel,
  });

  factory LabelState.initial({required LabelInitialParams initialParams}) {
    return const LabelState(
      labels: [],
      labelTitle: '',
      isCreateLabel: false,
      isEditExistingLabel: false,
    );
  }

  LabelState copyWith({
    List<String>? labels,
    String? labelTitle,
    bool? isCreateLabel,
    bool? isEditExistingLabel,
  }) {
    return LabelState(
      labels: labels ?? this.labels,
      labelTitle: labelTitle ?? this.labelTitle,
      isCreateLabel: isCreateLabel ?? this.isCreateLabel,
      isEditExistingLabel: isEditExistingLabel ?? this.isEditExistingLabel,
    );
  }
}
