import 'package:todo_list_bloc/models/todo_model.dart';

import '../services/splash_screen_service.dart';

class TodoRepository {
  final SplashScreenService splashScreenService;
  final List<TodoModel> _todoList = [];

  TodoRepository({required this.splashScreenService});

  // * Splash Screen

  final bool showSplashScreen = true;

  Future<bool> loadSplashScreen() async {
    return await splashScreenService.loadSplashScreen();
  }

  // * Todo List

  Future<List<TodoModel>> loadTodoList() =>
      Future.delayed(const Duration(seconds: 3), () => _todoList);

  Future<void> addTodo(TodoModel todo) {
    return Future.delayed(
        const Duration(seconds: 3), () => _todoList.add(todo));
  }

  Future<void> removeTodo(TodoModel todo) {
    return Future.delayed(
        const Duration(seconds: 3), () => _todoList.remove(todo));
  }
}
