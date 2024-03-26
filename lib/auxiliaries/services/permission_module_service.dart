import 'package:botanico/modules/worker/worker_permission.dart';
import 'package:get/get.dart';

import '../life_cycle_log.dart';
import '../module.dart';

class PermissionModuleService extends GetxService with LifeCycleLogService {
  @override
  String get logTag => 'PermissionModuleService';

  final workerModule = WorkerPermissions().toModule();

  List<Module> getAll() => [
        workerModule,
      ];
}
