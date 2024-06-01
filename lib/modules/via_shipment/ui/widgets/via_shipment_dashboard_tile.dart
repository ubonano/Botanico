import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../module.dart';

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

  bool _isSmallScreen(BoxConstraints constraints) => constraints.maxWidth < 600;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 1), vsync: this)..repeat(reverse: true);
    _colorAnimation = ColorTween(begin: Colors.transparent, end: Colors.redAccent).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Slidable(
          key: Key(_shipment.shipmentId),
          startActionPane: ActionPane(
            motion: const DrawerMotion(),
            extentRatio: _isSmallScreen(constraints) ? 1 : 0.50,
            children: [
              if (_shipment.isPending) ProcessSlidableButton(_shipment),
              if (_shipment.isInProcess) PrepareSlidableButton(_shipment),
              if (_shipment.isReady) DeliverSlidableButton(_shipment),
              if (_shipment.isDelivered) ArchiveSlidableButton(_shipment),
              if (_shipment.isNotInvoiced) InvoiceSlidableButton(_shipment),
              if (_shipment.isInvoiced) CancelInvoiceSlidableButton(_shipment),
              DeliveryPlaceSlidableButton(_shipment),
              EditSlidableButton(_shipment),
              DeleteSlidableButton(_shipment),
            ],
          ),
          child: AnimatedBuilder(
            animation: _colorAnimation,
            builder: (context, child) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  if (_isSmallScreen(constraints)) {
                    return ViaShipmentDashboardLayoutSmallTile(_shipment, _colorAnimation);
                  } else {
                    return ViaShipmentDashboardLayoutLargeTile(_shipment, _colorAnimation);
                  }
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
