import 'package:flutter/material.dart';

import '../../../model/enums/via_shipment_state.dart';

class StateTag extends StatelessWidget {
  final ViaShipmentState state;

  const StateTag({
    required this.state,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: viaShipmentStateToColor(state),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Center(
          child: Text(
            viaShipmentStateLabels[state]!,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
