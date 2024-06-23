import '../../../worker/model/permission_model.dart';
export '../../../worker/model/permission_model.dart';

abstract class IPermissionsStructure {
  String get id;
  String get name;
  List<PermissionModel> get permissions;
}
