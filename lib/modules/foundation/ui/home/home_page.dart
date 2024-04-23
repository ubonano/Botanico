import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_scaffold.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  get _title => 'Home';

  @override
  Widget build(BuildContext context) {
    controller.logTag;

    return CustomScaffold(
      key: key ?? const Key('HomePage'),
      title: _title,
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
