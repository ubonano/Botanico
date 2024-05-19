import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../module.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.logTag;

    return CustomScaffold(
      key: key ?? const Key('HomePage'),
      title: 'Home',
      drawer: CustomDrawer(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hola Mundo', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
