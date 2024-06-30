import 'package:flutter/material.dart';

import '../../../../../../setup/model/shipment_model.dart';
import 'state_tag.dart';

class StateWidget extends StatelessWidget {
  final ShipmentModel shipment;

  const StateWidget(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return StateTag(state: shipment.state);
  }
}
