import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../module.dart';

class ViaShipmentFormPage extends GetView<ViaShipmentFormController> {
  const ViaShipmentFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('ViaShipmentFormPage'),
      title: controller.isUpdateMode ? 'Via Shipment' : 'Create Via Shipment',
      actionButtons: controller.isUpdateMode ? const [ViaShipmentEnabledFormFields()] : [],
      drawer: null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              ShipmentIdInputField(controller),
              TypeInputField(controller),
              ClientInputField(controller),
              PackageInputField(controller),
              WeightInputField(controller),
              DescriptionInputField(controller),
              StateInputField(controller),
              IsInvoicedInputField(controller),
              CreatedDateTimeInputField(controller),
              DeliveryPlaceInputField(controller),
              const ViaShipmentSaveButton(),
            ],
          ),
        ),
      ),
    );
  }
}
