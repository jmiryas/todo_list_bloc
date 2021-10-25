part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class TodoLoadingState extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoLoadedState extends TodoState {
  final List<TodoModel> todoList;

  const TodoLoadedState({this.todoList = const <TodoModel>[]});

  @override
  List<Object> get props => [todoList];
}

class TodoErrorState extends TodoState {
  @override
  List<Object> get props => [];
}
