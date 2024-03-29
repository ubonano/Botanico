import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:get/get.dart';

class CustomDrawerController extends GetxController with ContextController {
  @override
  String get logTag => 'CustomDrawerController';

  String get companyName => session.company?.name ?? '';
  String get workerEmail => session.userEmail;
  String get workerName => session.worker?.name ?? '';

  void navigateToLinkedWorkers() => navigate.toWorkerList();
  void navigateToHome() => navigate.toHome();
}
