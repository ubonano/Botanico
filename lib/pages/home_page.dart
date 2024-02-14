import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../auth/controllers/auth_controller.dart';
import '../config/routes.dart';

class HomePage extends StatelessWidget {
  final AuthController authController = Get.find();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = authController.getLoggedInUser();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("UID: ${user?.uid}"),
            Text("Email: ${user?.email}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await authController.signOut();

                Get.offAllNamed(Routes.LOGIN);
              },
              child: const Text("Cerrar Sesión"),
            ),
          ],
        ),
      ),
    );
  }
}
