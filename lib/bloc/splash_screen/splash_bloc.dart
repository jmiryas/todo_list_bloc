import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../repositories/todo_repository.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final TodoRepository todoRepository;

  SplashBloc({required this.todoRepository})
      : super(SplashScreenLoadingState()) {
    on<SplashScreenStartedEvent>(_onStartedSplashScreen);
  }

  void _onStartedSplashScreen(
      SplashScreenStartedEvent event, Emitter<SplashState> emit) async {
    emit(SplashScreenLoadingState());

    try {
      final showSplashScreen = await todoRepository.loadSplashScreen();

      emit(SplashScreenLoadedState(showSplashScreen: showSplashScreen));
    } catch (_) {
      emit(SplashScreenErrorState());
    }
  }
}
