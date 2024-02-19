import 'package:get/get.dart';

import '../auth/controllers/auth_controller.dart';
import '../services/loggin_service.dart';
import '../services/navigation_service.dart';

mixin CommonServices on GetxController {
  late final LoggingService loggingService = Get.find();
  late final NavigationService navigationService = Get.find();
  late final AuthController authController = Get.find();
}
