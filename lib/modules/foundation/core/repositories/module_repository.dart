import 'package:botanico/modules/worker/worker_module_permission.dart';
import 'package:get/get.dart';

class ModuleRepository {
  final modules$ = [
    WorkerModulePermissions().toModel(),
  ].obs;
}
