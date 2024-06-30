import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../../../../app/ui/navigation.dart';
import '../../../../../../setup/interfaces/i_shipment_service.dart';

class ChangeStateSlidableButton extends StatelessWidget with AppNavigationInstance {
  final ShipmentModel shipment;

  ChangeStateSlidableButton(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) => _showChangeStateDialog(context),
      backgroundColor: Colors.purple,
      foregroundColor: Colors.white,
      icon: Icons.flag,
      label: 'Cambiar estado',
    );
  }

  void _showChangeStateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        ShipmentState selectedState = shipment.state;

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Estados'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: ShipmentState.values.map((entry) {
                  return RadioListTile<ShipmentState>(
                    title: Text(entry.label),
                    value: entry,
                    groupValue: selectedState,
                    onChanged: (ShipmentState? value) {
                      setState(() {
                        selectedState = value!;
                      });
                    },
                  );
                }).toList(),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cambiar estado'),
                  onPressed: () {
                    Get.find<IShipmentService>().changeState(
                      shipment,
                      selectedState,
                      validateTransition: false,
                    );
                    Get.back();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
