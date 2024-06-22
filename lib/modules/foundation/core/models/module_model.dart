import '../../../worker/core/model/worker_permission_model.dart';

class ModuleModel {
  final String id;
  final String name;
  final List<WorkerPermissionModel> permissions;

  ModuleModel({required this.id, required this.name, required this.permissions});
}
