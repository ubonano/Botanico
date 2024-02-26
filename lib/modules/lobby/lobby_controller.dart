import 'package:botanico/modules/foundation/services/common_services.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LobbyController extends GetxController with CommonServices {
  final RxString uid = ''.obs;

  @override
  void onInit() {
    super.onInit();

    uid.value = authService.currentUser?.uid ?? '';
  }

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: uid.value)).then((_) {
      Get.snackbar('Éxito', 'Codigo de vinculación copiado al portapapeles');
    });
  }

  void navigateToCompanyProfile() => navigationService.toCompanyProfile();
}
