import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/company/core/ui/widgets/to_create_company_button.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';

import 'package:botanico/modules/worker/worker_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class LobbyPage extends GetView<WorkerLobbyController> {
  const LobbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('lobbyPage'),
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
            const ToCreateCompanyButton(),
            const SignOutButton(),
          ],
        ),
      ),
    );
  }
}
