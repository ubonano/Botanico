import 'package:get/get.dart';

import '../../controllers/session_controller.dart';
import '../../services/navigation_service.dart';
import '../../utils/custom_controller.dart';

class CustomDrawerController extends GetxController with CustomController {
  @override
  String get logTag => 'CustomDrawerController';

  late final SessionController _session = Get.find();
  late final NavigationService _navigate = Get.find();

  String get companyName => _session.currentCompany?.name ?? '';
  String get workerEmail => _session.currentUserEmail;
  String get workerName => _session.currentWorker?.name ?? '';

  void navigateToLinkedWorkers() => _navigate.toLinkedWorkers();
  void navigateToHome() => _navigate.toHome();
}
