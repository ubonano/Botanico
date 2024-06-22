import '../../../worker/module.dart';

abstract class IModuleStructure {
  String get id;
  String get name;
  List<PermissionModel> get permissions;
}
