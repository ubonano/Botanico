import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? drawer;
  final List<Widget>? actionButtons;
  final bool showAppBar;

  const CustomScaffold({
    Key? key,
    required this.title,
    required this.body,
    this.floatingActionButton,
    required this.drawer,
    this.actionButtons,
    this.showAppBar = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar
          ? AppBar(
              title: Text(title),
              actions: actionButtons,
            )
          : null,
      drawer: drawer,
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
