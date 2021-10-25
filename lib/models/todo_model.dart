import 'package:flutter/material.dart';

class TodoModel {
  final String id;
  final String task;
  final String dateTime;
  final bool complete;
  final Color color;

  TodoModel({
    required this.id,
    required this.task,
    required this.dateTime,
    this.complete = false,
    required this.color,
  });
}
