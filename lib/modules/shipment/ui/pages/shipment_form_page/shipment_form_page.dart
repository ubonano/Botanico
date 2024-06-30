import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/ui/ui.dart';
import '../../../../authentication/ui/middlewares.dart';
import '../../../../worker/ui/middlewares.dart';
import '../../ui.dart';

class ShipmentFormPage extends GetView<ShipmentFormController> {
  const ShipmentFormPage({super.key});

  static navigate({String argument = '', bool canPop = false}) =>
      Get.find<AppNavigation>().to(route, arguments: argument, canPop: canPop);

  static const String route = '/shipment-form';

  static GetPage get page => GetPage(
        name: route,
        page: () => const ShipmentFormPage(),
        middlewares: [
          AuthMiddleware(),
          HasWorkerMiddleware(),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('ShipmentFormPage'),
      title: controller.isUpdateMode ? 'Envios' : 'Crear Envio',
      actionButtons: controller.isUpdateMode ? const [ShipmentEnabledFormFields()] : [],
      drawer: null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: ShipmentIdInputField(controller, required: false)),
                  const ShipmentIdSearchButton(),
                  const ShipmentPasteIdButton()
                ],
              ),
              TypeInputField(controller),
              ClientInputField(controller),
              PackageInputField(controller),
              WeightInputField(controller),
              DescriptionInputField(controller),
              const ShipmentSaveButton(),
              if (controller.isUpdateMode) ActionLogsList(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
