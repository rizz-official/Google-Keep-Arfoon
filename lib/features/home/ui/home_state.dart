import 'home_initial_params.dart';

class HomeState {
  final bool isWeb;
  final bool isDrawerVisible;

  const HomeState({
    required this.isWeb,
    required this.isDrawerVisible,
  });

  factory HomeState.initial({required HomeInitialParams initialParams}) =>
      const HomeState(
        isWeb: false,
        isDrawerVisible: true,
      );

  HomeState copyWith({bool? isWeb, bool? isDrawerVisible}) => HomeState(
    isWeb: isWeb ?? this.isWeb,
    isDrawerVisible: isDrawerVisible ?? this.isDrawerVisible,
  );
}
