import 'package:equatable/equatable.dart';

class Label extends Equatable {
  final int id;
  final String name;

  const Label({
    required this.id,
    required this.name,
  });

  const Label.empty()
      : id = 0,
        name = '';

  Label copyWith({
    int? id,
    String? name,
  }) =>
      Label(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  @override
  List<Object?> get props => [name, id];
}
