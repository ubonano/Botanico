import 'package:botanico/controllers/session_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../models/enums/worker_role.dart';
import '../../models/worker_model.dart';
import '../../services/navigation_service.dart';
import '../../services/worker_service.dart';
import '../../utils/async_operation_service.dart';
import '../../utils/custom_controller.dart';
import '../../controllers/form_controller.dart';
import '../../services/linked_worker_service.dart';
import '../../utils/snackbar_service.dart';

class LinkWorkerController extends FormController with CustomController {
  @override
  String get logTag => 'LinkWorkerController';

  @override
  List<String> formFields = [
    'uid',
  ];

  late final AsyncOperationService _async = Get.find();
  late final SnackbarService _snackbar = Get.find();
  late final NavigationService navigate = Get.find();
  late final SessionController _session = Get.find();
  late final LinkedWorkerService _linkedWorkerService = Get.find();
  late final WorkerService _workerService = Get.find();

  Future<void> linkWorker() async {
    if (validateForm()) {
      final workerToLink = await _workerService.get(getFieldValue('uid'));

      if (await canLink(workerToLink)) {
        await _async.perform(
          operationName: 'Link worker',
          successMessage: 'Trabajador vinculado',
          inTransaction: true,
          operation: (txn) async {
            await _linkedWorkerService.linkWorkerToCompany(
              workerToLink!,
              _session.currentCompanyId,
              WorkerRole.employee,
              txn: txn,
            );
            await _workerService.updateWorkerCompanyAndRole(
              workerToLink,
              _session.currentCompanyId,
              WorkerRole.employee,
              txn: txn,
            );
          },
          onSuccess: () {
            _linkedWorkerService.fetchAll(_session.currentCompanyId);
            navigate.toLinkedWorkers();
          },
        );
      }
    }
  }

  Future<bool> canLink(WorkerModel? worker) async {
    if (!_session.currentWorker!.hasPermissionToLinkWorker()) {
      _snackbar.error('Usted no tiene permiso para vincular trabajadores');
      return false;
    }

    if (worker == null) {
      _snackbar.error('No se encontro trabajador con el código ingresado');
      return false;
    }

    if (worker.companyId.isNotEmpty && worker.companyId != _session.currentCompanyId) {
      _snackbar.error('El trabajador ya se encuentra vinculado a otra empresa');
      return false;
    }

    if (await _linkedWorkerService.isWorkerAlreadyLinked(_session.currentCompanyId, worker)) {
      _snackbar.warning('El trabajador ya se encuentra vinculado');
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
