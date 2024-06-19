import 'permission_model.dart';

class ModuleModel {
  final String id;
  final String name;
  final List<PermissionModel> permissions;

  ModuleModel({required this.id, required this.name, required this.permissions});
}
