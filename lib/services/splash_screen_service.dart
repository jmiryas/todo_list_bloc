class SplashScreenService {
  Future<bool> loadSplashScreen() {
    return Future.delayed(const Duration(seconds: 3), () => false);
  }
}
