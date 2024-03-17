import 'package:botanico/models/enums/worker_role.dart';
import 'package:botanico/models/linked_worker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../services/custom_controller.dart';
import '../../services/linked_worker_service.dart';

class LinkWorkerController extends GetxController with CustomController {
  @override
  String get logTag => 'LinkWorkerController';

  late final linkedWorkerService = Get.find<LinkedWorkerService>();

  final formKey = GlobalKey<FormState>();

  final codeCtrl = TextEditingController();

  String get _code => codeCtrl.text.trim();

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) return;
// Refactor
    await async.perform(
      operationName: 'Link worker',
      successMessage: 'Trabajador vinculado!',
      inTransaction: true,
      operation: (txn) async {
        final worker = await workerService.get(_code);
        final linkedWorker = LinkedWorkerModel.fromWorkerModel(worker!, WorkerRole.employee);

        await linkedWorkerService.create(companyId, linkedWorker, txn: txn);
        await workerService.update(worker.copyWith(companyId: companyId), txn: txn);
      },
      onSuccess: () {
        linkedWorkerService.fetchAll(companyId);
        navigate.toLinkedWorkers();
      },
    );
  }

  void pasteWorkerId() async {
    final ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    codeCtrl.text = data?.text ?? '';
  }

  Future<void> scanQrCode() async {}

  @override
  void onClose() {
    codeCtrl.dispose();

    super.onClose();
  }
}
