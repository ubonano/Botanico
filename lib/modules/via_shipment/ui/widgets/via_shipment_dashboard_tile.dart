import 'package:flutter/material.dart';

import '../../module.dart';

class ViaShipmentDashboardTile extends StatefulWidget {
  final ViaShipmentModel viaShipment;

  const ViaShipmentDashboardTile(this.viaShipment, {super.key});

  @override
  _ViaShipmentDashboardTileState createState() => _ViaShipmentDashboardTileState();
}

class _ViaShipmentDashboardTileState extends State<ViaShipmentDashboardTile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: Colors.redAccent,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            color:
                widget.viaShipment.state == ViaShipmentState.pending.index ? _colorAnimation.value : Colors.transparent,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              columnWidths: const {
                0: FixedColumnWidth(100.0), // shipmentId
                1: FixedColumnWidth(100.0), // type
                2: FixedColumnWidth(100.0), // client
                3: FixedColumnWidth(100.0), // package
                4: FixedColumnWidth(100.0), // weight
                5: FixedColumnWidth(100.0), // description
                6: FixedColumnWidth(100.0), // state
                7: FixedColumnWidth(100.0), // invoiced
                8: FixedColumnWidth(100.0), // deliveryPlace
              },
              children: [
                TableRow(
                  children: [
                    IconWithText(
                      icon: Icons.numbers,
                      text: widget.viaShipment.shipmentId,
                      boldText: widget.viaShipment.shipmentId.length >= 4
                          ? widget.viaShipment.shipmentId.substring(widget.viaShipment.shipmentId.length - 4)
                          : null,
                    ),
                    IconWithText(
                      icon: Icons.local_shipping,
                      text: viaShipmentTypeLabels[viaShipmentTypeFromString(widget.viaShipment.type)]!,
                    ),
                    IconWithText(icon: Icons.person, text: widget.viaShipment.client),
                    IconWithText(icon: Icons.inventory, text: widget.viaShipment.package),
                    IconWithText(icon: Icons.line_weight, text: widget.viaShipment.weight.toString()),
                    IconWithText(icon: Icons.description, text: widget.viaShipment.description),
                    StateTag(state: widget.viaShipment.state),
                    IconWithText(
                      icon: widget.viaShipment.isInvoiced ? Icons.check_circle : Icons.cancel,
                      text: widget.viaShipment.isInvoiced ? 'Facturado' : 'No Facturado',
                    ),
                    IconWithText(icon: Icons.place, text: widget.viaShipment.deliveryPlace),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
