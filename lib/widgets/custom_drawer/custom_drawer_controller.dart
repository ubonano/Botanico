import 'package:get/get.dart';

import '../../utils/custom_controller.dart';

class CustomDrawerController extends GetxController with CustomController {
  @override
  String get logTag => 'CustomDrawerController';

  String get companyName => currentCompany?.name ?? '';
  String get workerEmail => currentUserEmail;
  String get workerName => currentWorker?.name ?? '';

  void navigateToLinkedWorkers() => navigate.toLinkedWorkers();
  void navigateToHome() => navigate.toHome();
}
