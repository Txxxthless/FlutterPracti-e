import 'package:flutter/material.dart';
import 'package:flutter_application_1/todo.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
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
                    builder: (context) => const TodoApp(),
                  ),
                );
              },
              child: const Text('Todo App'),
            ),
          ],
        ),
      ),
    );
  }
}
