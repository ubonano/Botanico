import 'package:get/get.dart';

import '../../controllers/session_controller.dart';
import '../../services/navigation_service.dart';
import '../../utils/life_cycle_log_controller.dart';

class CustomDrawerController extends GetxController with LifeCycleLogController {
  @override
  String get logTag => 'CustomDrawerController';

  late final SessionController _session = Get.find();
  late final NavigationService _navigate = Get.find();

  String get companyName => _session.company?.name ?? '';
  String get workerEmail => _session.userEmail;
  String get workerName => _session.worker?.name ?? '';

  void navigateToLinkedWorkers() => _navigate.toLinkedWorkers();
  void navigateToHome() => _navigate.toHome();
}
