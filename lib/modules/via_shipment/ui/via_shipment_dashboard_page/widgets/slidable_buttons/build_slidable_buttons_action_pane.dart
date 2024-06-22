import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/worker/module.dart';

import '../../../../module.dart';

List<Widget> buildSlidableLeftButtonsActionPane(ViaShipmentModel shipment) {
  List<Widget> buttons = [];

  if (shipment.isNotInvoiced && _hasPermission(ViaShipmentModule.invoiceKey)) {
    buttons.add(InvoiceSlidableButton(shipment));
  }
  if (shipment.isInvoiced && _hasPermission(ViaShipmentModule.cancelInvoiceKey)) {
    buttons.add(CancelInvoiceSlidableButton(shipment));
  }
  if (_hasPermission(ViaShipmentModule.changeDeliveryPlaceKey)) {
    buttons.add(ChangeDeliveryPlaceSlidableButton(shipment));
  }
  if (_hasPermission(ViaShipmentModule.updateKey)) {
    buttons.add(EditSlidableButton(shipment));
  }
  if (_hasPermission(ViaShipmentModule.deleteKey)) {
    buttons.add(DeleteSlidableButton(shipment));
  }
  return buttons;
}

List<Widget> buildSlidableRightButtonsActionPane(ViaShipmentModel shipment) {
  List<Widget> buttons = [];

  if (_hasPermission(ViaShipmentModule.changeStateKey)) {
    buttons.add(ChangeStateSlidableButton(shipment));
  }

  if (shipment.isPending && _hasPermission(ViaShipmentModule.processKey)) {
    buttons.add(ProcessSlidableButton(shipment));
  }
  if (shipment.isInProcess && _hasPermission(ViaShipmentModule.prepareKey)) {
    buttons.add(PrepareSlidableButton(shipment));
  }
  if (shipment.isReady && _hasPermission(ViaShipmentModule.deliverKey)) {
    buttons.add(DeliverSlidableButton(shipment));
  }
  if (shipment.isDelivered && _hasPermission(ViaShipmentModule.archiveKey)) {
    buttons.add(ArchiveSlidableButton(shipment));
  }

  return buttons;
}

bool _hasPermission(String permission) => Get.find<IWorkerService>().loggedWorker$?.hasPermission(permission) ?? false;
