import 'package:flutter/material.dart';

import '../../../../../../setup/model/shipment_model.dart';
import '../../../../../ui.dart';

class WeightWidget extends StatelessWidget {
  final ShipmentModel shipment;

  const WeightWidget(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconWithText(icon: Icons.balance, text: shipment.weight.toString());
  }
}
