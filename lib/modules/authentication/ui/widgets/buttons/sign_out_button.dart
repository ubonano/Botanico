import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../module.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      key: key ?? const Key('signOutButton'),
      text: 'Cerrar sesión',
      onPressed: Get.find<IAuthenticationService>().signOut,
    );
  }
}

class SignOutIconButton extends StatefulWidget {
  const SignOutIconButton({super.key});

  @override
  State<SignOutIconButton> createState() => _SignOutIconButtonState();
}

class _SignOutIconButtonState extends State<SignOutIconButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      key: widget.key ?? const Key('signOutButton'),
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: IconButton(
        icon: Icon(
          Icons.exit_to_app,
          color: _isHovering ? Colors.grey : Colors.white,
        ),
        onPressed: Get.find<IAuthenticationService>().signOut,
        tooltip: 'Cerrar sesión',
      ),
    );
  }
}
