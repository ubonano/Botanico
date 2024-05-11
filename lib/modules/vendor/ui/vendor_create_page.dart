import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';

import '../module.dart';

class VendorCreatePage extends GetView<VendorCreateController> {
  const VendorCreatePage({super.key});

  // TODO agregar campos faltantes... tipo de proveedor, tipo de inscripcion

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('VendorCreatePage'),
      title: 'Crear proveedor',
      drawer: null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              NameInputField(controller),
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
