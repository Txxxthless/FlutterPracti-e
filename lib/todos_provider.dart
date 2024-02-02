import 'package:flutter/material.dart';
import 'package:flutter_application_1/my_todo.dart';

class TodosProvider extends ChangeNotifier {
  List<MyTodo> _todos = [];
  List<MyTodo> get todos => _todos;

  void addTodo(MyTodo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void toggleComplete(int index) {
    _todos[index].completed = !_todos[index].completed;
    notifyListeners();
  }
}
