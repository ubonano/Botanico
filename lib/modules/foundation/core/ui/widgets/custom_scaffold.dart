import 'package:flutter/material.dart';

import 'custom_drawer.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? drawer;

  const CustomScaffold({
    Key? key,
    required this.title,
    required this.body,
    this.floatingActionButton,
    this.drawer = const CustomDrawer(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: key,
      appBar: AppBar(title: Text(title)),
      drawer: drawer,
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
