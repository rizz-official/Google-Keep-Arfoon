import 'package:fpdart/fpdart.dart';
import 'package:google_keep_arfoon/features/home/domain/failure/fetch_labels_failure.dart';
import 'package:google_keep_arfoon/features/label/domain/models/label_model.dart';

import '../../../label/domain/failures/add_label_failure.dart';
import '../../../label/domain/failures/delete_label_failure.dart';
import '../../../label/domain/failures/labels_list_failure.dart';
import '../../../label/domain/failures/update_label_failure.dart';

abstract class LabelsRepository {
  Future<Either<LabelsListFailure, List<Label>>> getLabels();


  Future<Either<AddLabelFailure, List<Label>>> addLabel(Label newLabel);


  Future<Either<UpdateLabelFailure, List<Label>>> updateLabel(Label updatedLabel);


  Future<Either<DeleteLabelFailure, List<Label>>> deleteLabel(int labelId);
}
