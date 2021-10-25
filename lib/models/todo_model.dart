import 'package:flutter/material.dart';

class TodoModel {
  final String id;
  final String task;
  final bool complete;
  final Color color;

  TodoModel({
    required this.id,
    required this.task,
    required this.complete,
    required this.color,
  });
}
