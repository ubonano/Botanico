import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../../../setup/model/shipment_model.dart';
import '../../../../../../ui.dart';

class EditSlidableButton extends StatelessWidget {
  final ShipmentModel shipment;

  const EditSlidableButton(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) => ShipmentFormPage.navigate(argument: shipment.id, canPop: true),
      backgroundColor: Colors.orange,
      foregroundColor: Colors.white,
      icon: Icons.edit,
      label: 'Editar',
    );
  }
}
