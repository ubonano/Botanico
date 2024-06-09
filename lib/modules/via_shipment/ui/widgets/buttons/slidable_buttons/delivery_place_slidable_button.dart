import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../../module.dart';

class DeliveryPlaceSlidableButton extends StatelessWidget with NavigationHelperInstance {
  final ViaShipmentModel shipment;

  DeliveryPlaceSlidableButton(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) => _showDeliveryPlaceDialog(context),
      backgroundColor: Colors.purple,
      foregroundColor: Colors.white,
      icon: Icons.place,
      label: 'Lugar de Entrega',
    );
  }

  void _showDeliveryPlaceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String selectedPlace = shipment.deliveryPlace;

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Lugares de Entrega'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: deliveryPlaceLabels.entries.map((entry) {
                  return RadioListTile<String>(
                    title: Text(entry.value),
                    value: deliveryPlaceToString(entry.key),
                    groupValue: selectedPlace,
                    onChanged: (String? value) {
                      setState(() {
                        selectedPlace = value!;
                      });
                    },
                  );
                }).toList(),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cambiar lugar de entrega'),
                  onPressed: () => Get.find<IViaShipmentService>()
                      .changeDeliveryPlace(shipment, deliveryPlaceFromString(selectedPlace)),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
