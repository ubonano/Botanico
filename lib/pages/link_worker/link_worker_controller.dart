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

  late final linkedWorkerService = Get.find<LinkedWorkerService>();
  final formKey = GlobalKey<FormState>();
  final textCtrls = List.generate(1, (_) => TextEditingController());
  List<String> get _fieldValues => textCtrls.map((ctrl) => ctrl.text.trim()).toList();

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) return;

    final worker = await workerService.get(_fieldValues[0]);

    if (!await canLink(worker)) return;

    await async.perform(
      operationName: 'Link worker',
      successMessage: 'Trabajador vinculado',
      inTransaction: true,
      operation: (txn) async => await _handleOperation(worker!, txn),
      onSuccess: _handleSuccessOperation,
    );
  }

  Future<bool> canLink(WorkerModel? worker) async {
    if (worker == null) {
      snackbar.error('No se encontro trabajador con el código ingresado');
      return false;
    }
    if (await _isWorkerAlreadyLinked(worker)) {
      snackbar.warning('El trabajador ya se encuentra vinculado');
      return false;
    }

    return true;
  }

  Future<bool> _isWorkerAlreadyLinked(WorkerModel worker) async {
    final workerGetted = await linkedWorkerService.get(loggedInCompanyId, worker.uid);
    return workerGetted != null;
  }

  Future<void> _handleOperation(WorkerModel worker, txn) async {
    await _createLinkedWorker(worker, txn);
    await _updateWithCompanyId(worker, txn);
  }

  void _handleSuccessOperation() {
    linkedWorkerService.fetchAll(loggedInCompanyId);
    navigate.toLinkedWorkers();
  }

  Future<void> _createLinkedWorker(WorkerModel worker, Transaction? txn) async {
    await linkedWorkerService.create(
      loggedInCompanyId,
      LinkedWorkerModel.fromWorkerModel(worker, WorkerRole.employee),
      txn: txn,
    );
  }

  Future<void> _updateWithCompanyId(WorkerModel worker, Transaction? txn) async {
    await workerService.update(
      worker.copyWith(companyId: loggedInCompanyId),
      txn: txn,
    );
  }

  void pasteWorkerId() async {
    final ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    textCtrls[0].text = data?.text ?? '';
  }

  Future<void> scanQrCode() async {}

  @override
  void onClose() {
    disposeControllers();

    super.onClose();
  }

  // ignore: avoid_function_literals_in_foreach_calls
  void disposeControllers() => textCtrls.forEach((controller) => controller.dispose());
}
