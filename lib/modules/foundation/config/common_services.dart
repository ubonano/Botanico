import 'package:botanico/modules/session/services/session_service.dart';
import 'package:botanico/modules/foundation/services/async_operation_service.dart';

import 'package:get/get.dart';

import '../services/loggin_service.dart';
import '../services/navigation_service.dart';

mixin CommonServices {
  late final NavigationService navigationService = Get.find();
  late final LoggingService loggingService = Get.find();
  late final SessionService sessionService = Get.find();
  late final AsyncOperationService asyncOperationService = Get.find();
}
