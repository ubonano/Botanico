import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class WorkerLobbyController extends GetxController with LifeCycleLogController, ContextController {
  @override
  String get logTag => 'WorkerLobbyController';

  final RxString uid = ''.obs;

  @override
  Future<void> onInit() async {
    await super.onInit();

    uid.value = session.userUID;
  }

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: uid.value)).then(
      (_) => snackbar.info('Codigo de vinculación copiado al portapapeles'),
    );
  }
}
