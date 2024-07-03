import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../worker/content/setup/interfaces/i_worker_service.dart';
import '../../../../../../setup/model/shipment_model.dart';
import '../../../../../../setup/module.dart';
import '../../../../../ui.dart';

final _module = Get.find<ShipmentModule>();

List<Widget> buildSlidableLeftButtonsActionPane(ShipmentModel shipment) {
  List<Widget> buttons = [];

  if (shipment.isNotInvoiced && _hasPermission(ShipmentKeys.invoice.id)) {
    buttons.add(InvoiceSlidableButton(shipment));
  }
  if (shipment.isInvoiced && _hasPermission(ShipmentKeys.cancelInvoice.id)) {
    buttons.add(CancelInvoiceSlidableButton(shipment));
  }
  if (_hasPermission(ShipmentKeys.changeDeliveryPlace.id)) {
    buttons.add(ChangeDeliveryPlaceSlidableButton(shipment));
  }
  if (_hasPermission(ShipmentKeys.update.id)) {
    buttons.add(EditSlidableButton(shipment));
  }

  if (_hasPermission(ShipmentKeys.cancel.id)) {
    buttons.add(CancelSlidableButton(shipment));
  }
  return buttons;
}

List<Widget> buildSlidableRightButtonsActionPane(ShipmentModel shipment) {
  List<Widget> buttons = [];

  if (_hasPermission(ShipmentKeys.changeState.id)) {
    buttons.add(ChangeStateSlidableButton(shipment));
  }

  if (shipment.isPending && _hasPermission(ShipmentKeys.process.id)) {
    buttons.add(ProcessSlidableButton(shipment));
  }
  if (shipment.isInProcess && _hasPermission(ShipmentKeys.prepare.id)) {
    buttons.add(PrepareSlidableButton(shipment));
  }
  if (shipment.isReady && _hasPermission(ShipmentKeys.deliver.id)) {
    buttons.add(DeliverSlidableButton(shipment));
  }
  if ((shipment.isDelivered || shipment.isCanceled) && _hasPermission(ShipmentKeys.archive.id)) {
    buttons.add(ArchiveSlidableButton(shipment));
  }

  return buttons;
}

bool _hasPermission(String permission) => Get.find<IWorkerService>().currentWorker$?.hasPermission(permission) ?? false;
