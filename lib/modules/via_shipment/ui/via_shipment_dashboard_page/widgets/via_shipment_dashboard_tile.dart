import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../module.dart';

class ViaShipmentDashboardTile extends StatefulWidget {
  final ViaShipmentModel shipment;

  const ViaShipmentDashboardTile(this.shipment, {super.key});

  @override
  _ViaShipmentDashboardTileState createState() => _ViaShipmentDashboardTileState();
}

class _ViaShipmentDashboardTileState extends State<ViaShipmentDashboardTile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  ViaShipmentModel get _shipment => widget.shipment;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 1), vsync: this)..repeat(reverse: true);
    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: _shipment.isPending ? Colors.orangeAccent : Colors.redAccent,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Slidable(
          key: Key(_shipment.shipmentId),
          startActionPane: ActionPane(
            motion: const DrawerMotion(),
            extentRatio: _isSmallScreen(constraints) ? 0.80 : 0.50,
            children: buildSlidableLeftButtonsActionPane(_shipment),
          ),
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            extentRatio: _isSmallScreen(constraints) ? 0.80 : 0.50,
            children: buildSlidableRightButtonsActionPane(_shipment),
          ),
          child: AnimatedBuilder(
            animation: _colorAnimation,
            builder: (context, child) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: _shipment.isPending ||
                              (_shipment.isInvoiced && (!_shipment.isReady && !_shipment.isDelivered))
                          ? _colorAnimation.value
                          : Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _isSmallScreen(constraints)
                          ? ViaShipmentDashboardLayoutSmallTile(_shipment, _colorAnimation)
                          : ViaShipmentDashboardLayoutLargeTile(_shipment, _colorAnimation),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  bool _isSmallScreen(BoxConstraints constraints) => constraints.maxWidth < 600;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
