import 'package:get/get.dart';

import '../../utils/custom_controller.dart';

class CustomDrawerController extends GetxController with CustomController {
  @override
  String get logTag => 'CustomDrawerController';

  String get companyName => company?.name ?? '';
  String get workerEmail => loggedUserEmail;
  String get workerName => worker?.name ?? '';
}
