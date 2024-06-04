import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../module.dart';

class WorkerList extends GetView<WorkerListController> {
  final List<WorkerModel> list;

  const WorkerList(this.list, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final WorkerModel worker = list[index];

        return ListTile(
          title: Text(worker.name),
          subtitle: Text(worker.email),
          trailing: worker.isNotOwner && worker.uid != controller.currentWorker?.uid
              ? WorkerListTileTrailingIconButtons(worker)
              : null,
        );
      },
    );
  }
}
