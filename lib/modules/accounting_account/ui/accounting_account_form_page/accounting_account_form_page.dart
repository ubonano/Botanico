import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/vendor/module.dart';
import 'package:botanico/modules/company/module.dart';

import '../../module.dart';

class AccountingAccountFormPage extends GetView<AccountingAccountFormController> {
  const AccountingAccountFormPage({super.key});

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
