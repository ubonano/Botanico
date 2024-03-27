import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:botanico/ui/custom_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class LobbyPage extends GetView<LobbyController> {
  const LobbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Lobby',
      drawer: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => QrImageView(
                data: controller.uid.value,
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),
            const SizedBox(height: 20),
            const Text('Mostrale este código a tu empleador para vincularte a la empresa.'),
            const SizedBox(height: 20),
            CustomTextButton(text: 'Copiar código de vinculación', onPressed: controller.copyToClipboard),
            CustomButton(text: '¿Necesitas registrar una empresa?', onPressed: controller.navigate.toCompany),
            const SignOutButton(),
          ],
        ),
      ),
    );
  }
}
