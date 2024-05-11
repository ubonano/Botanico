import '../../module.dart';

abstract class ModuleStructure {
  String get moduleId;
  String get moduleName;
  List<PermissionModel> get permissions;

  ModuleModel toModel() => ModuleModel(name: moduleName, permissions: permissions);
}
