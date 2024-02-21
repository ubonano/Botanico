import 'package:botanico/modules/auth/services/session_service.dart';

import 'package:get/get.dart';

import '../modules/foundation/services/loggin_service.dart';
import '../modules/foundation/services/navigation_service.dart';

mixin CommonServices on GetxController {
  late final NavigationService navigationService = Get.find();
  late final LoggingService loggingService = Get.find();
  late final SessionService sessionService = Get.find();
}
