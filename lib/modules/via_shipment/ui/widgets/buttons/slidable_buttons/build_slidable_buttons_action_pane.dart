import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/worker/module.dart';

import '../../../../module.dart';

List<Widget> buildSlidableButtonsActionPane(ViaShipmentModel shipment) {
  List<Widget> buttons = [];

  if (shipment.isPending && _hasPermission(ViaShipmentModulePermissions.processKey)) {
    buttons.add(ProcessSlidableButton(shipment));
  }
  if (shipment.isInProcess && _hasPermission(ViaShipmentModulePermissions.prepareKey)) {
    buttons.add(PrepareSlidableButton(shipment));
  }
  if (shipment.isReady && _hasPermission(ViaShipmentModulePermissions.deliverKey)) {
    buttons.add(DeliverSlidableButton(shipment));
  }
  if (shipment.isDelivered && _hasPermission(ViaShipmentModulePermissions.archiveKey)) {
    buttons.add(ArchiveSlidableButton(shipment));
  }
  if (shipment.isNotInvoiced && _hasPermission(ViaShipmentModulePermissions.invoiceKey)) {
    buttons.add(InvoiceSlidableButton(shipment));
  }
  if (shipment.isInvoiced && _hasPermission(ViaShipmentModulePermissions.cancelInvoiceKey)) {
    buttons.add(CancelInvoiceSlidableButton(shipment));
  }
  if (_hasPermission(ViaShipmentModulePermissions.changeDeliveryPlaceKey)) {
    buttons.add(DeliveryPlaceSlidableButton(shipment));
  }
  if (_hasPermission(ViaShipmentModulePermissions.updateKey)) {
    buttons.add(EditSlidableButton(shipment));
  }
  if (_hasPermission(ViaShipmentModulePermissions.deleteKey)) {
    buttons.add(DeleteSlidableButton(shipment));
  }
  return buttons;
}

bool _hasPermission(String permission) => Get.find<IWorkerService>().loggedWorker$?.hasPermission(permission) ?? false;
