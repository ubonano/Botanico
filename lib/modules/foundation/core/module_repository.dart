import 'package:get/get.dart';
import 'package:botanico/modules/worker/module.dart';

class ModuleRepository {
  final modules$ = [
    WorkerModulePermissions().toModel(),
  ].obs;
}
