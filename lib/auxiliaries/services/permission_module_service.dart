import 'package:botanico/modules/worker/worker_permission.dart';
import 'package:get/get.dart';

import '../module.dart';

class PermissionModuleService extends GetxService {
  final workerModule = WorkerPermissions().toModule();

  List<Module> getAll() => [
        workerModule,
      ];
}
