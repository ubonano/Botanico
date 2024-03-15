import 'package:get/get.dart';

import '../../services/custom_controller.dart';

class CustomDrawerController extends GetxController with CustomController {
  @override
  String get logTag => 'CustomDrawerController';

  String get companyName => company?.name ?? '';
  String get workerEmail => loggedUserEmail;
  String get workerName => worker?.name ?? '';

  void navigateToWorkers() => navigate.toWorkers();
  void navigateToHome() => navigate.toHome();
}
