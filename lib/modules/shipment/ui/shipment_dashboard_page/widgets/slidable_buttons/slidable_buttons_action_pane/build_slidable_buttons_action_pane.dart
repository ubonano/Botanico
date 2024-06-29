import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../worker/content/setup/interfaces/i_worker_service.dart';
import '../../../../../content/model/shipment_model.dart';
import '../../../../../content/setup/permissions.dart';
import '../../../../ui.dart';

final _module = Get.find<ShipmentPermissions>();

List<Widget> buildSlidableLeftButtonsActionPane(ShipmentModel shipment) {
  List<Widget> buttons = [];

  if (shipment.isNotInvoiced && _hasPermission(_module.invoiceKey)) {
    buttons.add(InvoiceSlidableButton(shipment));
  }
  if (shipment.isInvoiced && _hasPermission(_module.cancelInvoiceKey)) {
    buttons.add(CancelInvoiceSlidableButton(shipment));
  }
  if (_hasPermission(_module.changeDeliveryPlaceKey)) {
    buttons.add(ChangeDeliveryPlaceSlidableButton(shipment));
  }
  if (_hasPermission(_module.updateKey)) {
    buttons.add(EditSlidableButton(shipment));
  }

  if (_hasPermission(_module.cancelKey)) {
    buttons.add(CancelSlidableButton(shipment));
  }
  return buttons;
}

List<Widget> buildSlidableRightButtonsActionPane(ShipmentModel shipment) {
  List<Widget> buttons = [];

  if (_hasPermission(_module.changeStateKey)) {
    buttons.add(ChangeStateSlidableButton(shipment));
  }

  if (shipment.isPending && _hasPermission(_module.processKey)) {
    buttons.add(ProcessSlidableButton(shipment));
  }
  if (shipment.isInProcess && _hasPermission(_module.prepareKey)) {
    buttons.add(PrepareSlidableButton(shipment));
  }
  if (shipment.isReady && _hasPermission(_module.deliverKey)) {
    buttons.add(DeliverSlidableButton(shipment));
  }
  if ((shipment.isDelivered || shipment.isCanceled) && _hasPermission(_module.archiveKey)) {
    buttons.add(ArchiveSlidableButton(shipment));
  }

  return buttons;
}

bool _hasPermission(String permission) => Get.find<IWorkerService>().currentWorker$?.hasPermission(permission) ?? false;
