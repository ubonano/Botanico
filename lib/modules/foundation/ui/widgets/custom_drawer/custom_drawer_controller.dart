import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

class CustomDrawerController extends GetxController with ContextController {
  @override
  String get logTag => 'CustomDrawerController';

  String get companyName => auth.company?.name ?? '';
  String get workerEmail => auth.user?.email ?? '';
  String get workerName => auth.worker?.name ?? '';

  void navigateToLinkedWorkers() => navigate.toWorkerList();
  void navigateToHome() => navigate.toHome();
}
