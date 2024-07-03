import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/ui/ui.dart';
import '../../../../authentication/ui/middlewares.dart';
import '../../../../company/ui/ui.dart';
import '../../../../vendor/ui/ui.dart';
import '../../../../worker/ui/middlewares.dart';
import '../../../setup/module.dart';
import '../../ui.dart';

class AccountingAccountFormPage extends GetView<AccountingAccountFormController> {
  const AccountingAccountFormPage({super.key});

  static navigate({String argument = '', bool canPop = false}) =>
      Get.find<AppNavigation>().to(route, arguments: argument, canPop: canPop);

  static const String route = '/accounting-account-form';

  static GetPage get page => GetPage(
        name: route,
        page: () => const AccountingAccountFormPage(),
        middlewares: [
          AuthMiddleware(),
          HasWorkerMiddleware(),
          IsEmployedOrOwnerMiddleware(),
          AccessMiddleware(AccountingAccountModule.moduleId, AccountingAccountKeys.create.id),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('AccountingAccountFormPage'),
      title: controller.isUpdateMode ? 'Cuenta Contable' : 'Crear cuenta contable',
      actionButtons: controller.isUpdateMode ? const [AccountingAccountEnabledFormFields()] : [],
      drawer: null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              NameInputField(controller),
              ObservationsInputField(controller),
              const AccountingAccountSaveButton(),
            ],
          ),
        ),
      ),
    );
  }
}
