import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sign_out_controller.dart';

class SignOutButton extends GetView<SignOutController> {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => controller.signOut(),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
      child: const Text('Cerrar Sesión'),
    );
  }
}
