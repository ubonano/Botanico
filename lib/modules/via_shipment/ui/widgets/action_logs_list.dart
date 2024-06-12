import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../module.dart';

class ActionLogsList extends StatelessWidget {
  final ViaShipmentFormController controller;

  const ActionLogsList({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final actionLogs = controller.actionLogs;

        actionLogs.sort((a, b) => b.timestamp.compareTo(a.timestamp));

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            const Text('Logs de Acciones', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: actionLogs.length,
              itemBuilder: (context, index) {
                final log = actionLogs[index];
                return ListTile(
                  title: Text(log.action),
                  subtitle: Text('${log.timestamp} - ${log.user}'),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
