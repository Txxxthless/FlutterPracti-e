import 'package:flutter/material.dart';
import 'package:flutter_application_1/menu_page.dart';
import 'package:flutter_application_1/todos_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child: const AppWidget(),
    ),
  );
}

class AppWidget extends StatelessWidget {
  const AppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MenuPage(),
    );
  }
}
