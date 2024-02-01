import 'package:flutter/material.dart';

class ListViewExample extends StatelessWidget {
  List<String> items = List.generate(1000, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List view example'),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) => ListTile(
          tileColor: index.isEven ? Colors.lightBlue : Colors.white,
          title: Text('Item ${index + 1}'),
        ),
      ),
    );
  }
}
