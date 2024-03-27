import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:botanico/modules/authentication/module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

mixin LifeCycleLogController on GetxController {
  String get logTag;

  late final LogService _log = Get.find();

  @override
  Future<void> onInit() async {
    super.onInit();
    _log.debug('$logTag initiated');
  }

  @override
  void onClose() {
    _log.debug('$logTag destroyed');
    super.onClose();
  }
}

mixin LifeCycleLogService on GetxService {
  String get logTag;

  final _log = Get.find<LogService>();

  @override
  void onInit() {
    super.onInit();

    _log.debug('+ $logTag iniciado');
  }

  @override
  void onClose() {
    _log.debug('- $logTag eliminado');

    super.onClose();
  }
}

mixin ContextController on GetxController {
  late final OperationManagerService operationManager = Get.find();
  late final SessionService session = Get.find();
  late final SnackbarService snackbar = Get.find();
  late final NavigationService navigate = Get.find();
}

mixin ContextService on GetxService {
  late final FirebaseFirestore firestore = Get.find();
  late final SessionService session = Get.find();
  late final OperationManagerService operationManager = Get.find();
}
