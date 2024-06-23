import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/ui/ui.dart';
import '../../../company/ui/ui.dart';
import '../ui.dart';

class VendorFormPage extends GetView<VendorFormController> {
  const VendorFormPage({super.key});

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
