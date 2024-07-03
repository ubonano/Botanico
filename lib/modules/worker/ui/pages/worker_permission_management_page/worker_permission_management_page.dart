import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/ui/ui.dart';
import '../../../../authentication/ui/middlewares.dart';
import '../../../content/setup/module.dart';
import '../../middlewares.dart';
import '../../ui.dart';

class WorkerPermissionManagementPage extends GetView<WorkerPermissionManagementController> {
  const WorkerPermissionManagementPage({super.key});

  static navigate({String argument = '', bool canPop = false}) =>
      Get.find<AppNavigation>().to(route, arguments: argument, canPop: canPop);

  static const String route = '/worker-permissions';

  static get page => GetPage(
        name: route,
        page: () => const WorkerPermissionManagementPage(),
        middlewares: [
          AuthMiddleware(),
          HasWorkerMiddleware(),
          IsEmployedOrOwnerMiddleware(),
          AccessMiddleware(WorkerModule.moduleId, [WorkerKeys.managePermissions.id]),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('WorkerPermissionManagementPage'),
      title: 'Gestión de Permisos',
      drawer: null,
      body: Obx(() => ListView(children: controller.modules$.map((module) => ModuleExpansionTile(module)).toList())),
    );
  }
}
