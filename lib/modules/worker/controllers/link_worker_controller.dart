import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../module.dart';

class LinkWorkerController extends FormController with LifeCycleLogController, ContextController {
  @override
  String get logTag => 'LinkWorkerController';

  @override
  List<String> formFields = ['uid'];

  late final LinkedWorkerService _linkedWorkerService = Get.find();
  late final WorkerService _workerService = Get.find();

  @override
  Future<void> submit() async {
    final workerToLink = await _workerService.get(getFieldValue('uid'));

    if (await canLink(workerToLink)) {
      await operationManager.perform(
        operationName: 'Link worker',
        permissionKey: WorkerPermissions.linkKey,
        successMessage: 'Trabajador vinculado',
        inTransaction: true,
        operation: (txn) async {
          await _linkedWorkerService.linkWorkerToCompany(
            workerToLink!,
            session.companyId,
            role: WorkerRole.employee,
            txn: txn,
          );
          await _workerService.updateWorkerCompanyAndRole(
            workerToLink,
            session.companyId,
            WorkerRole.employee,
            txn: txn,
          );
        },
        onSuccess: () {
          _linkedWorkerService.fetchAll(session.companyId);
          navigate.toLinkedWorkers();
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

    if (await _linkedWorkerService.isWorkerAlreadyLinked(session.companyId, worker.uid)) {
      snackbar.warning('El trabajador ya se encuentra vinculado');
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
