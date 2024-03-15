import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sign_out_controller.dart';

class SignOutButton extends GetView<SignOutController> {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: controller.signOut,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
      child: const Text('Cerrar Sesión'),
    );
  }
}

class SignOutListTile extends GetView<SignOutController> {
  const SignOutListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.exit_to_app),
      title: const Text('Cerrar Sesión'),
      onTap: controller.signOut,
    );
  }
}

class SignOutIconButton extends StatefulWidget {
  const SignOutIconButton({Key? key}) : super(key: key);

  @override
  State<SignOutIconButton> createState() => _SignOutIconButtonState();
}

class _SignOutIconButtonState extends State<SignOutIconButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final signOutController = Get.find<SignOutController>();
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: IconButton(
        icon: Icon(
          Icons.exit_to_app,
          color: _isHovering ? Colors.grey : Colors.white,
        ),
        onPressed: signOutController.signOut,
        tooltip: 'Cerrar sesión',
      ),
    );
  }
}
