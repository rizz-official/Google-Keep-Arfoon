import 'package:equatable/equatable.dart';
import '../../../label/domain/models/label_model.dart';

class Notes extends Equatable {
  final int id;
  final String title;
  final String noteContent;
  final List<Label> label;

  const Notes({
    required this.id,
    required this.title,
    required this.noteContent,
    required this.label,
  });

  Notes.empty()
      : id = DateTime.now().millisecond,
        title = '',
        noteContent = '',
        label = const [];

  Notes copyWith({
    int? id,
    String? title,
    String? noteContent,
    List<Label>? label,
  }) =>
      Notes(
        id: id ?? this.id,
        title: title ?? this.title,
        noteContent: noteContent ?? this.noteContent,
        label: label ?? this.label,
      );

  @override
  List<Object?> get props => [
    id,
    title,
    noteContent,
    label,
  ];
}
