import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_bloc/routes/custom_app_route.dart';

import '../../bloc/todo/todo_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List BLoC"),
        centerTitle: true,
      ),
      body: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
        if (state is TodoLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is TodoLoadedState) {
          if (state.todoList.isEmpty) {
            return const Center(
              child: Text("Todo is empty!"),
            );
          } else {
            ListView.builder(
                itemCount: state.todoList.length,
                itemBuilder: (context, index) {
                  return const ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                    ),
                  );
                });
          }
        }

        return const Center(
          child: Text("Something went wrong!"),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CustomAppRoute.addTodoScreen);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
