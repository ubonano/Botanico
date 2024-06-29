import 'package:flutter/material.dart';

import '../../navigation.dart';

class HomePageTileButton extends StatelessWidget with AppNavigationInstance {
  HomePageTileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: key ?? const Key('HomePageTileButton'),
      leading: const Icon(Icons.home),
      title: const Text('Inicio'),
      onTap: navigate.toHome,
    );
  }
}
