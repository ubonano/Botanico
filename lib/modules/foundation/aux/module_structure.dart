import '../models/module_model.dart';
import '../models/permission_model.dart';

abstract class ModuleStructure {
  String get moduleId;
  String get moduleName;
  List<PermissionModel> get permissions;

  ModuleModel toModel() => ModuleModel(name: moduleName, permissions: permissions);
}
