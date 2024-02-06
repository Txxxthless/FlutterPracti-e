import 'package:flutter/material.dart';
import 'package:flutter_application_1/page_one.dart';
import 'package:flutter_application_1/page_two.dart';
import 'package:flutter_application_1/profile_page.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  static const name = 'home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                context.goNamed(PageOne.name);
              },
              child: const Text('Page One'),
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(
                  PageTwo.name,
                  extra: 'Hello worlds!',
                );
              },
              child: const Text('Page Two'),
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(
                  ProfilePage.name,
                  pathParameters: {
                    'id': '1',
                  },
                );
              },
              child: const Text('My Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
