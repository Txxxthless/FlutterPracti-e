import 'package:flutter/material.dart';
import 'package:flutter_application_1/page_one_details.dart';
import 'package:go_router/go_router.dart';

class PageOne extends StatelessWidget {
  static const name = 'one';
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page One'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                context.goNamed(PageOneDetails.name);
              },
              child: const Text('Page One Details'),
            ),
          ],
        ),
      ),
    );
  }
}
