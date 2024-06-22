import '../../module.dart';

abstract class ModuleStructure {
  String get moduleId;
  String get moduleName;
  List<WorkerPermissionModel> get permissions;

  ModuleModel toModel() => ModuleModel(id: moduleId, name: moduleName, permissions: permissions);
}
