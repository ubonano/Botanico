import 'package:get/get.dart';

import '../utils/life_cycle_log_service.dart';
import '../models/module_model.dart';
import '../models/permission_model.dart';

class ModuleService extends GetxService with LifeCycleLogService {
  @override
  String get logTag => 'ModuleService';

  List<Module> getAll() => [
        _workerModule(),
      ];

  Module _workerModule() {
    return Module(
      name: 'Trabajadores',
      permissions: [
        Permission(id: 'linkedWorker.view', name: 'Ver'),
        Permission(id: 'linkedWorker.link', name: 'Vincular'),
        Permission(id: 'linkedWorker.unlink', name: 'Desvincular'),
      ],
    );
  }
}
