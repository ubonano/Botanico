import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../module.dart';

class ViaShipmentList extends GetView<ViaShipmentListController> with NavigationHelperInstance {
  ViaShipmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var list = controller.viaShipmentList$.toList();

        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index) {
            final ViaShipmentModel viaShipment = list[index];

            return ListTile(
              title: Row(
                children: [
                  const Icon(Icons.numbers),
                  const SizedBox(width: 4),
                  Text(viaShipment.shipmentId),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.person),
                      const SizedBox(width: 4),
                      Text(viaShipment.client),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: viaShipmentStateToColor(viaShipmentStateFromString(viaShipment.state)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      viaShipmentStateLabels[viaShipmentStateFromString(viaShipment.state)]!,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Tooltip(
                    message: viaShipmentTypeLabels[viaShipmentTypeFromString(viaShipment.type)]!,
                    child: Icon(viaShipmentTypeIcons[viaShipmentTypeFromString(viaShipment.type)]),
                  ),
                  Tooltip(
                    message: viaShipment.isInvoiced ? 'Facturado' : 'No Facturado',
                    child: Icon(
                      viaShipment.isInvoiced ? Icons.check_circle : Icons.cancel,
                      color: viaShipment.isInvoiced ? Colors.green : Colors.red,
                    ),
                  ),
                  const SizedBox(width: 20),
                  ViaShipmentListTileTrailingIconButtons(viaShipment),
                ],
              ),
              onTap: () => navigate.toViaShipmentForm(id: viaShipment.id, canPop: true),
            );
          },
        );
      },
    );
  }
}
