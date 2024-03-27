import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:botanico/ui/custom_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class LobbyPage extends GetView<LobbyController> {
  const LobbyPage({super.key});

  get _title => 'Lobby';
  get _info => 'Mostrale este código a tu empleador para vincularte a la empresa.';
  get _copyButtonText => 'Copiar código de vinculación';
  get _toCompanyButtonText => '¿Necesitas registrar una empresa?';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: _title,
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
            Text(_info),
            const SizedBox(height: 20),
            CustomTextButton(text: _copyButtonText, onPressed: controller.copyToClipboard),
            CustomButton(text: _toCompanyButtonText, onPressed: controller.navigate.toCompany),
            const SignOutButton(),
          ],
        ),
      ),
    );
  }
}
