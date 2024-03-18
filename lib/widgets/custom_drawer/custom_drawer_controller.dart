import 'package:get/get.dart';

import '../../utils/custom_controller.dart';

class CustomDrawerController extends GetxController with CustomController {
  @override
  String get logTag => 'CustomDrawerController';

  String get companyName => loggedIncompany?.name ?? '';
  String get workerEmail => loggedUserEmail;
  String get workerName => loggedInWorker?.name ?? '';

  void navigateToLinkedWorkers() => navigate.toLinkedWorkers();
  void navigateToHome() => navigate.toHome();
}
