import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../module.dart';

class EditSlidableButton extends StatelessWidget with NavigationHelperInstance {
  final ViaShipmentModel viaShipment;

  EditSlidableButton(this.viaShipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) => navigate.toViaShipmentForm(id: viaShipment.id, canPop: true),
      backgroundColor: Colors.orange,
      foregroundColor: Colors.white,
      icon: Icons.edit,
      label: 'Editar',
    );
  }
}
