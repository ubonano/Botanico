import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controllers/session_controller.dart';
import '../../utils/life_cycle_log_controller.dart';
import '../../utils/snackbar_service.dart';

class LobbyController extends GetxController with LifeCycleLogController {
  @override
  String get logTag => 'LobbyController';

  late final SnackbarService _snackbar = Get.find();
  late final SessionController _session = Get.find();

  final RxString uid = ''.obs;

  @override
  Future<void> onInit() async {
    await super.onInit();

    uid.value = _session.userUID;
  }

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: uid.value)).then(
      (_) => _snackbar.info('Codigo de vinculación copiado al portapapeles'),
    );
  }
}
