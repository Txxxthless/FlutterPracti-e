import 'package:flutter/material.dart';

class InputWidgetsExample extends StatefulWidget {
  const InputWidgetsExample({super.key});

  @override
  State<InputWidgetsExample> createState() => _InputWidgetsExampleState();
}

class _InputWidgetsExampleState extends State<InputWidgetsExample> {
  final nameController = TextEditingController();
  final countries = ['Australia', 'Canada', 'Ukraine', 'France'];
  String? country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Widgets'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                label: Text('Enter tour name'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print(nameController.text);
              },
              child: Text('Ok'),
            ),
            DropdownButton<String>(
              hint: Text('Select your country'),
              value: country,
              items: countries
                  .map(
                    (e) => DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(
                  () {
                    country = value;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
