import 'package:flutter/material.dart';

import '../../../../../setup/model/shipment_model.dart';
import '../../../../ui.dart';

class ClientWidget extends StatelessWidget {
  final ShipmentModel shipment;

  const ClientWidget(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconWithText(icon: Icons.person, text: shipment.client);
  }
}
