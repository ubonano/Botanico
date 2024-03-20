import 'package:botanico/models/enums/worker_role.dart';
import 'package:botanico/models/linked_worker_model.dart';
import 'package:botanico/utils/custom_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../models/company_model.dart';
import '../../services/linked_worker_service.dart';

class CompanyCreateController extends GetxController with CustomController {
  @override
  String get logTag => 'CompanyCreateController';

  late final linkedWorkerService = Get.find<LinkedWorkerService>();
  final formKey = GlobalKey<FormState>();
  final textCtrls = List.generate(6, (_) => TextEditingController());
  List<String> get _fieldValues => textCtrls.map((ctrl) => ctrl.text.trim()).toList();

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) return;

    await async.perform(
      operationName: 'Create company',
      successMessage: 'Empresa creada',
      inTransaction: true,
      operation: _handleOperation,
      onSuccess: _handleOnSuccess,
    );
  }

  Future<void> _handleOperation(txn) async {
    final companyCreated = await companyService.create(
      CompanyModel(
        ownerUid: loggedUserUID,
        name: _fieldValues[0],
        address: _fieldValues[1],
        city: _fieldValues[2],
        province: _fieldValues[3],
        country: _fieldValues[4],
        phone: _fieldValues[5],
      ),
      txn: txn,
    );

    await _updateLoggedInWorkerWithCompanyId(companyCreated.uid, txn);
    await _linkLoggedInWorkerToCompany(companyCreated.uid, txn);
  }

  void _handleOnSuccess() async {
    fetchWorker();
    fetchCompany();
    navigate.toHome();
  }

  Future<void> _updateLoggedInWorkerWithCompanyId(String companyId, txn) async {
    await workerService.update(
      loggedInWorker!.copyWith(companyId: companyId),
      txn: txn,
    );
  }

  Future<void> _linkLoggedInWorkerToCompany(String companyId, txn) async {
    await linkedWorkerService.create(
      companyId,
      LinkedWorkerModel.fromWorkerModel(loggedInWorker!, WorkerRole.owner),
      txn: txn,
    );
  }

  @override
  void onClose() {
    disposeControllers();

    super.onClose();
  }

  // ignore: avoid_function_literals_in_foreach_calls
  void disposeControllers() => textCtrls.forEach((controller) => controller.dispose());
}
