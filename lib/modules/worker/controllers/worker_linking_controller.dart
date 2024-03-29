import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../module.dart';

class WorkerLinkingController extends FormController with ContextController {
  @override
  String get logTag => 'WorkerLinkingController';

  @override
  List<String> formFields = ['uid'];

  late final WorkerService _workerService = Get.find();
  late final WorkerListController _workerListController = Get.find();

  @override
  Future<void> submit() async {
    final worker = await _workerService.getWorker(getFieldValue('uid'));

    if (await canLink(worker)) {
      await operationManager.perform(
        operationName: 'Link worker',
        permissionKey: WorkerPermissions.linkKey,
        successMessage: 'Trabajador vinculado',
        inTransaction: true,
        operation: (txn) async =>
            await _workerService.linkWorker(worker!, session.companyId, WorkerRole.employee, txn: txn),
        onSuccess: () {
          _workerListController.fetchAllWorkers();
          navigate.toWorkerList();
        },
      );
    }
  }

  Future<bool> canLink(WorkerModel? worker) async {
    if (worker == null) {
      snackbar.error('No se encontro trabajador con el código ingresado');
      return false;
    }

    if (worker.companyId.isNotEmpty && worker.companyId != session.companyId) {
      snackbar.error('El trabajador ya se encuentra vinculado a otra empresa');
      return false;
    }

    return true;
  }

  void pasteWorkerId() async {
    final ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    setFieldValue('uid', data?.text ?? '');
  }

  Future<void> scanQrCode() async {}
}
