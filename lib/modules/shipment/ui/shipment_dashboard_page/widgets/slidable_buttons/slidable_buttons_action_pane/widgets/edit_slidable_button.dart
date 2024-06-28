import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../../../app/content/setup/navigation.dart';
import '../../../../../../content/model/shipment_model.dart';

class EditSlidableButton extends StatelessWidget with NavigationHelperInstance {
  final ShipmentModel shipment;

  EditSlidableButton(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) => navigate.toShipmentForm(id: shipment.id, canPop: true),
      backgroundColor: Colors.orange,
      foregroundColor: Colors.white,
      icon: Icons.edit,
      label: 'Editar',
    );
  }
}
