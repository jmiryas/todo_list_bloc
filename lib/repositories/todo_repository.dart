import '../services/splash_screen_service.dart';

class TodoRepository {
  final SplashScreenService splashScreenService;

  TodoRepository({required this.splashScreenService});

  final bool showSplashScreen = true;

  Future<bool> loadSplashScreen() async {
    return await splashScreenService.loadSplashScreen();
  }
}
