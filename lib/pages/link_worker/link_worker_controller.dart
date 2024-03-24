import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../models/enums/worker_role.dart';
import '../../models/worker_model.dart';
import '../../utils/custom_controller.dart';
import '../../utils/form_controller.dart';
import '../../services/linked_worker_service.dart';

class LinkWorkerController extends FormController with CustomController {
  @override
  String get logTag => 'LinkWorkerController';

  @override
  List<String> formFields = [
    'uid',
  ];

  late final LinkedWorkerService _linkedWorkerService = Get.find();

  Future<void> linkWorker() async {
    if (validateForm()) {
      final workerToLink = await workerService.get(getFieldValue('uid'));

      if (await canLink(workerToLink)) {
        await async.perform(
          operationName: 'Link worker',
          successMessage: 'Trabajador vinculado',
          inTransaction: true,
          operation: (txn) async {
            await _linkedWorkerService.linkWorkerToCompany(
              workerToLink!,
              currentCompanyId,
              WorkerRole.employee,
              txn: txn,
            );
            await workerService.updateWorkerCompanyAndRole(
              workerToLink,
              currentCompanyId,
              WorkerRole.employee,
              txn: txn,
            );
          },
          onSuccess: () {
            _linkedWorkerService.fetchAll(currentCompanyId);
            navigate.toLinkedWorkers();
          },
        );
      }
    }
  }

  Future<bool> canLink(WorkerModel? worker) async {
    if (worker == null) {
      snackbar.error('No se encontro trabajador con el código ingresado');
      return false;
    }

    if (worker.companyId.isNotEmpty && worker.companyId != currentCompanyId) {
      snackbar.error('El trabajador ya se encuentra vinculado a otra empresa');
      return false;
    }

    if (await _linkedWorkerService.isWorkerAlreadyLinked(currentCompanyId, worker)) {
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
