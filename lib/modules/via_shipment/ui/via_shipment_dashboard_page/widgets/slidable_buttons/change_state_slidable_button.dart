import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../../module.dart';

class ChangeStateSlidableButton extends StatelessWidget with NavigationHelperInstance {
  final ViaShipmentModel shipment;

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
        ViaShipmentState selectedState =
            ViaShipmentState.values.firstWhere((element) => element.index == shipment.state);

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Estados'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: ViaShipmentState.values.map((entry) {
                  return RadioListTile<ViaShipmentState>(
                    title: Text(viaShipmentStateLabels[entry]!),
                    value: entry,
                    groupValue: selectedState,
                    onChanged: (ViaShipmentState? value) {
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
                    Get.find<IViaShipmentService>().changeState(
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
