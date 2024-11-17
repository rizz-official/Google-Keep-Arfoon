import 'package:fpdart/fpdart.dart';
import 'package:google_keep_arfoon/features/label/domain/failures/add_label_failure.dart';
import 'package:google_keep_arfoon/features/label/domain/failures/labels_list_failure.dart';
import 'package:google_keep_arfoon/features/label/domain/failures/update_label_failure.dart';
import 'package:google_keep_arfoon/features/label/domain/failures/delete_label_failure.dart';
import 'package:google_keep_arfoon/features/label/domain/models/label_model.dart';
import '../domain/repository/labels_repository.dart';

class MockLabelsRepository implements LabelsRepository {
  List<Label> labels = [
    const Label(id: 1, name: 'Work'),
    const Label(id: 2, name: 'Personal'),
    const Label(id: 3, name: 'Shopping'),
    const Label(id: 4, name: 'Study'),
    const Label(id: 5, name: 'Projects'),
    const Label(id: 6, name: 'Finance'),
  ];

  @override
  Future<Either<LabelsListFailure, List<Label>>> getLabels() async {
    return right(labels);
  }

  @override
  Future<Either<AddLabelFailure, List<Label>>> addLabel(Label newLabel) async {
    labels.add(newLabel);
    return right(labels);
  }

  @override
  Future<Either<UpdateLabelFailure, List<Label>>> updateLabel(
      Label updatedLabel) async {
    final index = labels.indexWhere((label) => label.id == updatedLabel.id);
    if (index == -1) {
      return left(UpdateLabelFailure(error: 'Label not found'));
    }
    labels[index] = updatedLabel;
    return right(labels);
  }

  @override
  Future<Either<DeleteLabelFailure, List<Label>>> deleteLabel(
      int labelId) async {
    final index = labels.indexWhere((label) => label.id == labelId);
    if (index == -1) {
      return left(DeleteLabelFailure(error: 'Label not found'));
    }
    labels.removeAt(index);
    return right(labels);
  }
}
