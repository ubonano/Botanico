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
    userProfileController.initializeFormFields();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () {
                final userProfile = userProfileController.userProfile.value;
                return userProfile != null
                    ? Column(
                        children: [
                          Text("UID: ${userProfile.uid}"),
                          Text("Email: ${userProfile.email}"),
                          Text("Nombre: ${userProfile.name}"),
                          Text("Fecha de Nacimiento: ${userProfile.birthDate}"),
                          Text("Teléfono: ${userProfile.phone}"),
                          Text("DNI: ${userProfile.dni}"),
                        ],
                      )
                    : const Text("Cargando perfil...");
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  navigationService.navigateToUserProfile(canPop: true),
              child: const Text("Perfil del Usuario"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async => await authController.signOut(),
              child: const Text("Cerrar Sesión"),
            ),
          ],
        ),
      ),
    );
  }
}
