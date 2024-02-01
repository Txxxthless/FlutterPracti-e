import 'package:flutter/material.dart';
import 'package:flutter_application_1/menu_page.dart';

void main() {
  runApp(
    const AppWidget(),
  );
}

class AppWidget extends StatelessWidget {
  const AppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuPage(),
    );
  }
}

