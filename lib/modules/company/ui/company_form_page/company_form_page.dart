import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/ui/navigation.dart';
import '../../../app/ui/ui.dart';
import '../../../authentication/ui/middlewares.dart';
import '../../../worker/ui/middlewares.dart';
import '../../../worker/ui/ui.dart';
import '../ui.dart';

class CompanyFormPage extends GetView<CompanyFormController> {
  const CompanyFormPage({super.key});

  static navigate({String argument = '', bool canPop = false}) =>
      Get.find<AppNavigation>().to(route, arguments: argument, canPop: canPop);

  static const String route = '/company-form';

  static GetPage get page => GetPage(
        name: route,
        page: () => const CompanyFormPage(),
        middlewares: [
          AuthMiddleware(),
          HasWorkerMiddleware(),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('CompanyFormPage'),
      title: controller.isUpdateMode ? 'Empresa' : 'Crear empresa',
      actionButtons: controller.isUpdateMode ? const [CompanyEnabledFormFields()] : [],
      drawer: null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  NameInputField(controller),
                  AddressInputField(controller),
                  CityInputField(controller),
                  ProvinceInputField(controller),
                  CountryInputField(controller),
                  PhoneInputField(controller),
                  const CompanySaveButton(),
                ],
              ),
            ),
            if (controller.isUpdateMode) ...[
              Obx(
                () => Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: Get.find<WorkerPermissionManagementController>()
                        .modules$
                        .map((module) => ModuleActiveToggle(module))
                        .toList(),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
