import 'package:flutter/material.dart';
import 'package:todo_list_bloc/screens/todo/add_edit_todo_screen.dart';

import '../routes/custom_app_route.dart';
import '../screens/home/home_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CustomAppRoute.homeScreen:
        return CustomAppRoute.goToRoute(
            const HomeScreen(), CustomAppRoute.homeScreen);
      case CustomAppRoute.addTodoScreen:
        return CustomAppRoute.goToRoute(
            const AddEditTodoScreen(
              title: "Add Todo",
            ),
            CustomAppRoute.addTodoScreen);
      default:
        return CustomAppRoute.goToRoute(
            const HomeScreen(), CustomAppRoute.homeScreen);
    }
  }
}
