import '../../model/permission_model.dart';
export '../../model/permission_model.dart';

abstract class IPermissionsStructure {
  String get id;
  String get name;
  List<PermissionModel> get permissions;
}
