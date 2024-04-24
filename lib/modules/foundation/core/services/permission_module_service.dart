import 'package:botanico/modules/worker/worker_module_permission.dart';
import 'package:get/get.dart';

import '../models/module_model.dart';

class PermissionModuleService extends GetxService {
  final workerModule = WorkerModulePermissions().toModel();

  List<ModuleModel> getAll() => [
        workerModule,
      ];
}
