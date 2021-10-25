part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class TodoStartedEvent extends TodoEvent {
  @override
  List<Object> get props => [];
}

class TodoAddedEvent extends TodoEvent {
  final TodoModel todo;

  const TodoAddedEvent({required this.todo});

  @override
  List<Object> get props => [todo];
}

class TodoRemovedEvent extends TodoEvent {
  final TodoModel todo;

  const TodoRemovedEvent({required this.todo});

  @override
  List<Object> get props => [todo];
}
