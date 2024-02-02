import 'package:flutter/material.dart';
import 'package:flutter_application_1/todo.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TodoApp(),
                  ),
                );
              },
              child: Text('Todo App'),
            ),
          ],
        ),
      ),
    );
  }
}
