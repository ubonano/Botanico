import 'package:flutter/material.dart';

import '../../../../../content/model/shipment_model.dart';
import '../../../../ui.dart';

class DeliveryPlaceWidget extends StatelessWidget {
  final ShipmentModel shipment;

  const DeliveryPlaceWidget(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconWithText(icon: Icons.place, text: deliveryPlaceLabels[deliveryPlaceFromString(shipment.deliveryPlace)]!);
  }
}
