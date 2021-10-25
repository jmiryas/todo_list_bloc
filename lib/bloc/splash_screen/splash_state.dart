part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {
  const SplashState();
}

class SplashScreenLoadingState extends SplashState {
  @override
  List<Object> get props => [];
}

class SplashScreenLoadedState extends SplashState {
  final bool showSplashScreen;

  const SplashScreenLoadedState({this.showSplashScreen = true});

  @override
  List<Object> get props => [showSplashScreen];

  @override
  String toString() {
    return '''PostState { status: $showSplashScreen}''';
  }
}

class SplashScreenErrorState extends SplashState {
  @override
  List<Object> get props => [];
}
