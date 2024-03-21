import 'package:botanico/models/enums/worker_role.dart';
import 'package:botanico/models/linked_worker_model.dart';
import 'package:botanico/models/worker_model.dart';
import 'package:botanico/utils/custom_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../models/company_model.dart';
import '../../services/linked_worker_service.dart';

class CompanyCreateController extends GetxController with CustomController {
  @override
  String get logTag => 'CompanyCreateController';

  late final _linkedWorkerService = Get.find<LinkedWorkerService>();
  final formKey = GlobalKey<FormState>();
  final textCtrls = List.generate(6, (_) => TextEditingController());
  List<String> get _fieldValues => textCtrls.map((ctrl) => ctrl.text.trim()).toList();

  Future<void> createCompany() async {
    if (!formKey.currentState!.validate()) return;

    await async.perform(
      operationName: 'Create company',
      successMessage: 'Empresa creada',
      inTransaction: true,
      operation: _createCompany,
      onSuccess: _onCompanyCreated,
    );
  }

  Future<void> _createCompany(txn) async {
    final newCompany = CompanyModel(
      ownerUid: loggedUserUID,
      name: _fieldValues[0],
      address: _fieldValues[1],
      city: _fieldValues[2],
      province: _fieldValues[3],
      country: _fieldValues[4],
      phone: _fieldValues[5],
    );

    final companyCreated = await companyService.create(newCompany, txn: txn);

    await _updateWorkerWithCompanyId(currentWorker!, companyCreated.uid, txn);
    await _linkWorkerToCompany(currentWorker!, companyCreated.uid, txn);
  }

  void _onCompanyCreated() async {
    await fetchWorker();
    await fetchCompany();

    navigate.toHome();
  }

  Future<void> _updateWorkerWithCompanyId(WorkerModel worker, String companyId, txn) async {
    final updatedWorker = worker.copyWith(companyId: companyId);
    await workerService.update(updatedWorker, txn: txn);
  }

  Future<void> _linkWorkerToCompany(WorkerModel worker, String companyId, txn) async {
    final linkedWorker = LinkedWorkerModel.fromWorkerModel(worker, WorkerRole.owner);
    await _linkedWorkerService.create(companyId, linkedWorker, txn: txn);
  }

  @override
  void onClose() {
    disposeControllers();

    super.onClose();
  }

  // ignore: avoid_function_literals_in_foreach_calls
  void disposeControllers() => textCtrls.forEach((controller) => controller.dispose());
}
