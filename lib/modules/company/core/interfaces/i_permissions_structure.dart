import '../../../worker/module.dart';

abstract class IPermissionsStructure {
  String get id;
  String get name;
  List<PermissionModel> get permissions;
}
