import 'package:botanico/modules/worker/core/helpers/interfaces/i_worker_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

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
            extentRatio: _isSmallScreen(constraints) ? 0.80 : 0.50,
            children: _buildSlidableButtons(),
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
                            : Colors.transparent),
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

  List<Widget> _buildSlidableButtons() {
    List<Widget> buttons = [];

    if (_shipment.isPending && _hasPermission(ViaShipmentModulePermissions.processKey)) {
      buttons.add(ProcessSlidableButton(_shipment));
    }
    if (_shipment.isInProcess && _hasPermission(ViaShipmentModulePermissions.prepareKey)) {
      buttons.add(PrepareSlidableButton(_shipment));
    }
    if (_shipment.isReady && _hasPermission(ViaShipmentModulePermissions.deliverKey)) {
      buttons.add(DeliverSlidableButton(_shipment));
    }
    if (_shipment.isDelivered && _hasPermission(ViaShipmentModulePermissions.archiveKey)) {
      buttons.add(ArchiveSlidableButton(_shipment));
    }
    if (_shipment.isNotInvoiced && _hasPermission(ViaShipmentModulePermissions.invoiceKey)) {
      buttons.add(InvoiceSlidableButton(_shipment));
    }
    if (_shipment.isInvoiced && _hasPermission(ViaShipmentModulePermissions.cancelInvoiceKey)) {
      buttons.add(CancelInvoiceSlidableButton(_shipment));
    }
    if (_hasPermission(ViaShipmentModulePermissions.changeDeliveryPlaceKey)) {
      buttons.add(DeliveryPlaceSlidableButton(_shipment));
    }
    if (_hasPermission(ViaShipmentModulePermissions.updateKey)) {
      buttons.add(EditSlidableButton(_shipment));
    }
    if (_hasPermission(ViaShipmentModulePermissions.deleteKey)) {
      buttons.add(DeleteSlidableButton(_shipment));
    }
    return buttons;
  }

  bool _hasPermission(String permission) =>
      Get.find<IWorkerService>().loggedWorker$?.hasPermission(permission) ?? false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
