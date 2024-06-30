import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/ui/ui.dart';
import '../../../../authentication/ui/middlewares.dart';
import '../../../../company/ui/ui.dart';
import '../../../../worker/ui/middlewares.dart';
import '../../ui.dart';

class VendorFormPage extends GetView<VendorFormController> {
  const VendorFormPage({super.key});

  static navigate({String argument = '', bool canPop = false}) =>
      Get.find<AppNavigation>().to(route, arguments: argument, canPop: canPop);

  static const String route = '/vendor-form';

  static GetPage get page => GetPage(
        name: route,
        page: () => const VendorFormPage(),
        middlewares: [
          AuthMiddleware(),
          HasWorkerMiddleware(),
          IsEmployedOrOwnerMiddleware(),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('VendorFormPage'),
      title: controller.isUpdateMode ? 'Proveedor' : 'Crear proveedor',
      actionButtons: controller.isUpdateMode ? const [VendorEnabledFormFields()] : [],
      drawer: null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              NameInputField(controller),
              CuitInputField(controller),
              RegistrationTypeInputField(controller),
              AddressInputField(controller),
              PhoneInputField(controller),
              ObservationsInputField(controller),
              const VendorSaveButton(),
            ],
          ),
        ),
      ),
    );
  }
}
