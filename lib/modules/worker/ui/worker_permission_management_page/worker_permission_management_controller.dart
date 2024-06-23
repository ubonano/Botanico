import 'package:get/get.dart';

import '../../../company/helpers/life_cycle_logging_controller_helper.dart';
import '../../../company/model/module_repository.dart';
import '../../../company/setup/interfaces/i_permissions_structure.dart';

class WorkerPermissionManagementController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'WorkerPermissionManagementController';

  late final ModuleRepository _moduleRepo = Get.find();

  List<IPermissionsStructure> get modules$ => _moduleRepo.modules$;
}
