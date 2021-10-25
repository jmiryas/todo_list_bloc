import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../routes/app_router.dart';
import '../bloc/todo/todo_bloc.dart';
import '../simple_bloc_observer.dart';
import '../routes/custom_app_route.dart';
import '../screens/splash/splash_screen.dart';
import '../repositories/todo_repository.dart';
import '../services/splash_screen_service.dart';
import '../bloc/splash_screen/splash_bloc.dart';
import '../screens/navigation/bottom_navigation_screen.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  runApp(MyApp(
    todoRepository: TodoRepository(splashScreenService: SplashScreenService()),
  ));
}

class MyApp extends StatelessWidget {
  final TodoRepository todoRepository;

  const MyApp({Key? key, required this.todoRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => SplashBloc(todoRepository: todoRepository)
                ..add(SplashScreenStartedEvent())),
          BlocProvider(
              create: (_) => TodoBloc(todoRepository: todoRepository)
                ..add(TodoStartedEvent()))
        ],
        child: BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
          if (state is SplashScreenLoadingState) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Todo List BLoC",
              home: SplashScreen(),
            );
          }

          if (state is SplashScreenLoadedState) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Todo List BLoC",
              onGenerateRoute: AppRouter.onGenerateRoute,
              initialRoute: CustomAppRoute.homeScreen,
              home: BottomNavigationScreen(),
            );
          }

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Todo List BLoC",
            home: Scaffold(
                backgroundColor: Colors.blueGrey.shade900,
                body: const Center(
                  child: Text(
                    "Something went wrong.",
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  ),
                )),
          );
        }));
  }
}
