import 'package:botanico/models/enums/worker_role.dart';
import 'package:botanico/models/linked_worker_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../models/worker_model.dart';
import '../../utils/custom_controller.dart';
import '../../services/linked_worker_service.dart';

class LinkWorkerController extends GetxController with CustomController {
  @override
  String get logTag => 'LinkWorkerController';

  @override
  // ignore: overridden_fields
  Map<String, TextEditingController> textControllers = {
    'uid': TextEditingController(),
  };

  late final _linkedWorkerService = Get.find<LinkedWorkerService>();

  final formKey = GlobalKey<FormState>();

  Future<void> linkWorker() async {
    if (!formKey.currentState!.validate()) return;

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
          await workerService.updateWorkerWithCompanyId(
            workerToLink,
            currentCompanyId,
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
