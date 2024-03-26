import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../ui/widgets/buttons/custom_button.dart';
import 'sign_out_controller.dart';

class SignOutButton extends GetView<SignOutController> {
  const SignOutButton({super.key});

  void _submit() => controller.signOut();

  @override
  Widget build(BuildContext context) {
    return CustomButton(text: 'Cerrar sesión', onPressed: _submit);
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
