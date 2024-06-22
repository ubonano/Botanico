import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

class WorkerPermissionManagementController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'WorkerPermissionManagementController';

  late final ModuleRepository _moduleRepo = Get.find();

  List<IModuleStructure> get modules$ => _moduleRepo.modules$;
}
