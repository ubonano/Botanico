import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/ui/ui.dart';
import '../../../../authentication/ui/middlewares.dart';
import '../../../content/setup/module.dart';
import '../../middlewares.dart';
import '../../ui.dart';

class WorkerListPage extends GetView<WorkerListController> {
  const WorkerListPage({super.key});

  static navigate({String argument = '', bool canPop = false}) =>
      Get.find<AppNavigation>().to(route, arguments: argument, canPop: canPop);

  static const String route = '/worker-list';

  static get page => GetPage(
        name: route,
        page: () => const WorkerListPage(),
        middlewares: [
          AuthMiddleware(),
          HasWorkerMiddleware(),
          IsEmployedOrOwnerMiddleware(),
          AccessMiddleware(WorkerModule.moduleId, [WorkerKeys.view.id]),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('workerListPage'),
      title: 'Trabajadores Vinculados',
      drawer: const CustomDrawer(),
      body: Obx(() => WorkerList(controller.list$.toList())),
      floatingActionButton: const WorkerLinkFAB(),
    );
  }
}
