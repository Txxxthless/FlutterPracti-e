import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int count = 0;

  @override
  Widget build(BuildContext build) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              count++;
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Pressed times'),
          Text(
            '$count',
            style: TextStyle(fontSize: 24),
          ),
        ],
      )),
    );
  }
}
