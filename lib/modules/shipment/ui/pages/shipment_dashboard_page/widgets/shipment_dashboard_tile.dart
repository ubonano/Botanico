import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../setup/model/shipment_model.dart';
import '../../../ui.dart';

class ShipmentDashboardTile extends StatefulWidget {
  final ShipmentModel shipment;

  const ShipmentDashboardTile(this.shipment, {super.key});

  @override
  _ShipmentDashboardTileState createState() => _ShipmentDashboardTileState();
}

class _ShipmentDashboardTileState extends State<ShipmentDashboardTile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  ShipmentModel get _shipment => widget.shipment;

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
                          ? ShipmentDashboardLayoutSmallTile(_shipment, _colorAnimation)
                          : ShipmentDashboardLayoutLargeTile(_shipment, _colorAnimation),
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
