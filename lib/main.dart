import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Botanico',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Botanico V 0'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
