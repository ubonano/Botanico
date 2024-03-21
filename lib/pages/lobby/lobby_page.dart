import 'package:botanico/widgets/sign_out_button/sign_out_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../widgets/buttons/custom_button.dart';
import '../../widgets/buttons/custom_text_button.dart';
import '../../widgets/custom_scaffold.dart';
import 'lobby_controller.dart';

class LobbyPage extends GetView<LobbyController> {
  const LobbyPage({super.key});

  String get _uid => controller.uid.value;

  get _info => 'Mostrale este código a tu empleador para vincularte a la empresa.';
  get _copyButtonText => 'Copiar código de vinculación';
  get _toCompanyButtonText => '¿Necesitas registrar una empresa?';

  void _copyToClipboard() => controller.copyToClipboard();
  void _toCompany() => controller.navigate.toCompany();

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
            Text(_info),
            const SizedBox(height: 20),
            CustomTextButton(text: _copyButtonText, onPressed: _copyToClipboard),
            CustomButton(text: _toCompanyButtonText, onPressed: _toCompany),
            const SignOutButton(),
          ],
        ),
      ),
    );
  }
}
