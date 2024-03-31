import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

class CustomDrawerController extends GetxController with ContextController {
  @override
  String get logTag => 'CustomDrawerController';

  String get companyName => session.company?.name ?? '';
  String get workerEmail => session.user?.email ?? '';
  String get workerName => session.worker?.name ?? '';

  void navigateToLinkedWorkers() => navigate.toWorkerList();
  void navigateToHome() => navigate.toHome();
}
