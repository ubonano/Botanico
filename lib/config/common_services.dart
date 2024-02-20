import 'package:get/get.dart';

import '../modules/auth/controllers/auth_controller.dart';
import '../modules/foundation/services/loggin_service.dart';
import '../modules/foundation/services/navigation_service.dart';

mixin CommonServices on GetxController {
  late final LoggingService loggingService = Get.find();
  late final NavigationService navigationService = Get.find();
  late final AuthController authController = Get.find();
}
