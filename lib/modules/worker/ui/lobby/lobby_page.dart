import 'package:botanico/modules/authentication/ui/sign_out_button/sign_out_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../auxiliaries/services/navigation_service.dart';
import '../../../../ui/widgets/buttons/custom_button.dart';
import '../../../../ui/widgets/buttons/custom_text_button.dart';
import '../../../../ui/widgets/custom_scaffold.dart';
import 'lobby_controller.dart';

class LobbyPage extends GetView<LobbyController> {
  const LobbyPage({super.key});

  get _title => 'Lobby';
  get _info => 'Mostrale este código a tu empleador para vincularte a la empresa.';
  get _copyButtonText => 'Copiar código de vinculación';
  get _toCompanyButtonText => '¿Necesitas registrar una empresa?';

  NavigationService get _navigate => Get.find<NavigationService>();

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
            CustomButton(text: _toCompanyButtonText, onPressed: _navigate.toCompany),
            const SignOutButton(),
          ],
        ),
      ),
    );
  }
}
