import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/todo_repository.dart';
import '../../models/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository;

  TodoBloc({required this.todoRepository}) : super(TodoLoadingState()) {
    on<TodoStartedEvent>(_onStartedTodo);
  }

  void _onStartedTodo(TodoStartedEvent event, Emitter<TodoState> emit) async {
    emit(TodoLoadingState());

    try {
      final todoList = await todoRepository.loadTodoList();

      emit(TodoLoadedState(todoList: todoList));
    } catch (_) {
      emit(TodoErrorState());
    }
  }

  void _onAddTodo(TodoAddedEvent event, Emitter<TodoState> emit) async {
    final state = this.state;

    if (state is TodoLoadedState) {
      emit(TodoLoadingState());

      try {
        await todoRepository.addTodo(event.todo);
        emit(TodoLoadedState(todoList: [...state.todoList, event.todo]));
      } catch (_) {
        emit(TodoErrorState());
      }
    }
  }

  void _onRemoveTodo(TodoRemovedEvent event, Emitter<TodoState> emit) async {
    final state = this.state;

    if (state is TodoLoadedState) {
      emit(TodoLoadingState());

      try {
        await todoRepository.removeTodo(event.todo);
        emit(
            TodoLoadedState(todoList: [...state.todoList]..remove(event.todo)));
      } catch (_) {
        emit(TodoErrorState());
      }
    }
  }
}
