import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../module.dart';

class ViaShipmentFilters extends GetView<ViaShipmentListController> {
  const ViaShipmentFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Flexible(
                child: TextField(
                  controller: controller.startDateController,
                  decoration: const InputDecoration(labelText: 'Fecha Desde'),
                  readOnly: true,
                  onTap: () => _selectDate(context, controller.startDateController),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: TextField(
                  controller: controller.endDateController,
                  decoration: const InputDecoration(labelText: 'Fecha Hasta'),
                  readOnly: true,
                  onTap: () => _selectDate(context, controller.endDateController),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Flexible(
                child: TextField(
                  controller: controller.shipmentIdController,
                  decoration: const InputDecoration(labelText: 'Nro de Envío'),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.check),
                onPressed: controller.restartStream,
              ),
              IconButton(
                icon: const Icon(Icons.clear, color: Colors.red),
                onPressed: () {
                  controller.cleanFilters();
                  controller.restartStream();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) controller.text = picked.toString().split(' ')[0];
  }
}
