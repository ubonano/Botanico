import 'package:botanico/widgets/sign_out_button/sign_out_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../widgets/buttons/custom_button.dart';
import '../../widgets/custom_scaffold.dart';
import 'lobby_controller.dart';

class LobbyPage extends GetView<LobbyController> {
  const LobbyPage({super.key});

  String get _uid => controller.uid.value;

  void _copyToClipboard() => controller.copyToClipboard();
  void _toCompany() => controller.toCompany();

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
                data: _uid,
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),
            const SizedBox(height: 20),
            const Text('Mostra este código a tu empleador para vincularte a la empresa.'),
            CustomButton(text: 'Copiar código de vinculación', onPressed: _copyToClipboard),
            CustomButton(text: '¿Necesitas registrar una empresa?', onPressed: _toCompany),
            const SignOutButton(),
          ],
        ),
      ),
    );
  }
}
