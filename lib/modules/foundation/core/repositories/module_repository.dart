import 'package:botanico/modules/worker/module.dart';
import 'package:get/get.dart';

class ModuleRepository {
  final modules$ = [
    WorkerModulePermissions().toModel(),
  ].obs;
}
