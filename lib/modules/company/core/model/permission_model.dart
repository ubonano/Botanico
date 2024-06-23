class PermissionModel {
  final String id;
  final String name;
  final bool isActive;

  PermissionModel({required this.id, required this.name, this.isActive = false});
}
