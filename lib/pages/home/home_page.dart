import 'package:botanico/widgets/sign_out_button/sign_out_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.logTag;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hola Mundo', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            SignOutButton(),
          ],
        ),
      ),
    );
  }
}
