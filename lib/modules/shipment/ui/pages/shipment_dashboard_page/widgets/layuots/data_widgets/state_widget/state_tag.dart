import 'package:flutter/material.dart';

import '../../../../../../../setup/model/enums/shipment_state.dart';

class StateTag extends StatelessWidget {
  final ShipmentState state;

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
          color: state.color,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Center(
          child: Text(
            state.label,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
