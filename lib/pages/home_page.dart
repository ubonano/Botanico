import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../auth/controllers/auth_controller.dart';

import '../auth/controllers/user_profile_controller.dart';
import '../services/navigation_service.dart';

class HomePage extends StatelessWidget {
  final AuthController authController = Get.find();
  final UserProfileController userProfileController = Get.find();
  final NavigationService navigationService = Get.find();

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
                userProfileController.clearUserProfileData();

                navigationService.navigateToLogin();
              },
              child: const Text("Cerrar Sesión"),
            ),
          ],
        ),
      ),
    );
  }
}
