import 'package:get/get.dart';

import '../../../modules/authentication/services/session_service.dart';
import '../../../auxiliaries/services/navigation_service.dart';
import '../../../auxiliaries/life_cycle_log.dart';

class CustomDrawerController extends GetxController with LifeCycleLogController {
  @override
  String get logTag => 'CustomDrawerController';

  late final SessionService _session = Get.find();
  late final NavigationService _navigate = Get.find();

  String get companyName => _session.company?.name ?? '';
  String get workerEmail => _session.userEmail;
  String get workerName => _session.worker?.name ?? '';

  void navigateToLinkedWorkers() => _navigate.toLinkedWorkers();
  void navigateToHome() => _navigate.toHome();
}
