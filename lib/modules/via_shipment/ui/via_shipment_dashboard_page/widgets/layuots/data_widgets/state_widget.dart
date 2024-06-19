import 'package:flutter/material.dart';
import '../../../../../module.dart';

class StateWidget extends StatelessWidget {
  final ViaShipmentModel shipment;

  const StateWidget(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return StateTag(state: shipment.state);
  }
}
