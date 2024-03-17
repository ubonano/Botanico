import 'package:botanico/models/enums/worker_role.dart';
import 'package:botanico/models/linked_worker.dart';
import 'package:botanico/utils/custom_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../models/worker_model.dart';
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

    await async.perform(
      operationName: 'Get worker',
      operation: (_) async {
        final worker = await getWorkerByCode();

        await _linkWorker(worker);
      },
    );
  }

  Future<void> _linkWorker(WorkerModel worker) async {
    await async.perform(
      operationName: 'Link worker',
      successMessage: 'Trabajador vinculado!',
      inTransaction: true,
      operation: (txn) async {
        final linkedWorker = getLinkedWorkerByWorker(worker);
        final workerModified = getWorkerUpdatedByCompanyId(worker);

        await linkedWorkerService.create(companyId, linkedWorker, txn: txn);
        await workerService.update(workerModified, txn: txn);
      },
      onSuccess: () {
        linkedWorkerService.fetchAll(companyId);
        navigate.toLinkedWorkers();
      },
    );
  }

  Future<WorkerModel> getWorkerByCode() async {
    final worker = await workerService.get(_code);

    if (worker == null) {
      throw WorkerNotFoundException(message: 'No se encontro trabajador con el código ingresado');
    }

    return worker;
  }

  WorkerModel getWorkerUpdatedByCompanyId(WorkerModel worker) => worker.copyWith(companyId: companyId);

  LinkedWorkerModel getLinkedWorkerByWorker(WorkerModel worker) =>
      LinkedWorkerModel.fromWorkerModel(worker, WorkerRole.employee);

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
