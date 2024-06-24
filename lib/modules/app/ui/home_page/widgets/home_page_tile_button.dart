import 'package:flutter/material.dart';

import '../../../content/setup/navigation.dart';

class HomePageTileButton extends StatelessWidget with NavigationHelperInstance {
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
