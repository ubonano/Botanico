import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class WorkerLobbyController extends GetxController with ContextController {
  @override
  String get logTag => 'WorkerLobbyController';

  final RxString uid = ''.obs;

  @override
  void onInit() async {
    super.onInit();

    uid.value = authRepo.user?.uid ?? '';
  }

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: uid.value)).then(
      (_) => snackbar.info('Codigo de vinculación copiado al portapapeles'),
    );
  }
}
