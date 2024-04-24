import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class WorkerLobbyController extends GetxController with LifeCycleLogging {
  @override
  String get logTag => 'WorkerLobbyController';

  late final SnackbarService snackbar = Get.find();
  late final AuthRepository authRepo = Get.find();

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
