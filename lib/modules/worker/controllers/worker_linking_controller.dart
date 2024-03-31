import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../module.dart';

class WorkerLinkingController extends GetxController with FormController, ContextController {
  @override
  String get logTag => 'WorkerLinkingController';

  @override
  List<String> formFields = ['uid'];

  late final WorkerService _workerService = Get.find();
  late final WorkerListController _workerListController = Get.find();

  @override
  Future<void> submit() async {
    final worker = await _workerService.getWorker(getFieldValue('uid'));

    if (validate(worker)) {
      await operationManager.perform(
        operationName: 'Link worker',
        permissionKey: WorkerModulePermissions.linkKey,
        successMessage: 'Trabajador vinculado',
        inTransaction: true,
        operation: (txn) async => await _workerService.linkWorker(worker!, txn: txn),
        onSuccess: () {
          _workerListController.fetchAllWorkers();
          navigate.toWorkerList();
        },
      );
    }
  }

  bool validate(WorkerModel? worker) {
    if (worker == null) {
      snackbar.error('No se encontro trabajador con el código ingresado');
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
