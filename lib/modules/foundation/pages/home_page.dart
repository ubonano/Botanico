import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/services/auth_service.dart';
import '../../auth/controllers/user_profile_controller.dart';
import '../services/navigation_service.dart';

class HomePage extends StatelessWidget {
  final AuthService authService = Get.find();
  final UserProfileController userProfileController = Get.find();
  final NavigationService navigationService = Get.find();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                final userProfile = authService.userProfileObx.value;
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
              onPressed: () => navigationService.navigateToUserProfile(canPop: true),
              child: const Text("Perfil del Usuario"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await authService.signOut();
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
