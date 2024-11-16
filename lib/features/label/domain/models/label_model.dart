import 'package:equatable/equatable.dart';

class Label extends Equatable {
  final String labelTitle;

  const Label({
    required this.labelTitle,
  });

  const Label.empty() : labelTitle = '';

  Label copyWith({
    String? labelTitle,
  }) =>
      Label(
        labelTitle: labelTitle ?? this.labelTitle,
      );

  @override
  List<Object?> get props => [labelTitle];
}
