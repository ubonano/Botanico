import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/ui/ui.dart';
import '../../../../authentication/ui/middlewares.dart';
import '../../middlewares.dart';
import '../../ui.dart';

class WorkerLinkPage extends GetView<WorkerLinkController> {
  const WorkerLinkPage({super.key});

  static navigate({String argument = '', bool canPop = false}) =>
      Get.find<AppNavigation>().to(route, arguments: argument, canPop: canPop);

  static const String route = '/worker-link';

  static get page => GetPage(
        name: route,
        page: () => const WorkerLinkPage(),
        middlewares: [
          AuthMiddleware(),
          HasWorkerMiddleware(),
          IsEmployedOrOwnerMiddleware(),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('WorkerLinkPage'),
      title: 'Vincular Trabajador',
      drawer: null,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(child: WorkerUidInputField(controller, onFieldSubmitted: controller.secureSubmit)),
                    const WorkerPasteUidButton(),
                  ],
                ),
                const WorkerLinkButton(),
                const WorkerScanQrButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
