import 'module.dart';
import 'permission.dart';

abstract class PermissionsModule {
  String get moduleId;
  String get moduleName;
  List<Permission> get permissions;

  Module toModule() => Module(name: moduleName, permissions: permissions);
}
