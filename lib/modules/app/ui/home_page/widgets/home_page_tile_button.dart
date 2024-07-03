import 'package:flutter/material.dart';

import '../../ui.dart';

class HomePageTileButton extends StatelessWidget {
  const HomePageTileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: key ?? const Key('HomePageTileButton'),
      leading: const Icon(Icons.home),
      title: const Text('Inicio'),
      onTap: HomePage.navigate,
    );
  }
}
