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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 1), vsync: this)..repeat(reverse: true);
    _colorAnimation = ColorTween(begin: Colors.transparent, end: Colors.redAccent).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(_shipment.shipmentId),
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.50,
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
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(color: _shipment.isPending ? _colorAnimation.value : Colors.transparent),
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
                      ShipmentIdWidget(_shipment),
                      ShipmentTypeWidget(_shipment),
                      ClientWidget(_shipment),
                      PackageWidget(_shipment),
                      WeightWidget(_shipment),
                      DescriptionWidget(_shipment),
                      StateWidget(_shipment),
                      InvoicedWidget(_shipment),
                      DeliveryPlaceWidget(_shipment),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
