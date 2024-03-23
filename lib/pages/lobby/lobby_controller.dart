import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/custom_controller.dart';

class LobbyController extends GetxController with CustomController {
  @override
  String get logTag => 'LobbyController';

  final RxString uid = ''.obs;

  @override
  Future<void> onInit() async {
    await super.onInit();

    uid.value = currentUserUID;
  }

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: uid.value)).then(
      (_) => snackbar.info('Codigo de vinculación copiado al portapapeles'),
    );
  }
}
