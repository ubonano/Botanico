import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:get/get.dart';

import '../../company_module.dart';

class CompanyCreateController extends GetxController
    with FormController, LifeCycleLogging, GlobalServices, AuthContext, WorkerContext, CompanyContext {
  @override
  String get logTag => 'CompanyCreateController';

  @override
  List<String> formFields = [
    FieldKeys.name,
    FieldKeys.address,
    FieldKeys.city,
    FieldKeys.province,
    FieldKeys.country,
    FieldKeys.phone,
  ];

  @override
  Future<void> submit() async => await createCompany(_newCompany);

  Future<void> createCompany(CompanyModel company) async {
    await oprManager.perform(
      operationName: 'Create company',
      inTransaction: true,
      operation: (txn) async {
        await companyRepo.create(company, txn: txn);

        final worker = await _getWorkerModified(company.uid);
        await workerRepo.updateWorker(worker, txn: txn);
      },
      onSuccess: navigate.toHome,
    );
  }

  CompanyModel get _newCompany => CompanyModel(
        uid: companyRepo.generateId,
        ownerUid: authRepo.user!.uid,
        name: getFieldValue(FieldKeys.name),
        address: getFieldValue(FieldKeys.address),
        city: getFieldValue(FieldKeys.city),
        province: getFieldValue(FieldKeys.province),
        country: getFieldValue(FieldKeys.country),
        phone: getFieldValue(FieldKeys.phone),
      );

  Future<WorkerModel> _getWorkerModified(String companyId) async {
    final WorkerModel? worker = await workerRepo.get(authRepo.user!.uid);

    if (worker == null) throw WorkerNotFoundException();

    worker.companyId = companyId;
    worker.role = WorkerRole.owner;

    return worker;
  }
}
