import 'package:get/get.dart';

import '../../../../app/content/helpers/life_cycle_logging_controller_helper.dart';
import '../../../../app/content/model/module_repository.dart';
import '../../../../app/content/setup/interfaces/i_module_structure.dart';

class WorkerPermissionManagementController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'WorkerPermissionManagementController';

  late final ModuleRepository _moduleRepo = Get.find();

  List<IModuleStructure> get modules$ => _moduleRepo.modules$;
}
