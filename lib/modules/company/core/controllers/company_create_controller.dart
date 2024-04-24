import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:get/get.dart';

import '../../company_module.dart';

class CompanyCreateController extends GetxController with FormController, ContextController {
  @override
  String get logTag => 'CompanyCreateController';

  late final CompanyRepository _companyRepository = Get.find();
  late final WorkerRepository _workerRepository = Get.find();

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
        await _companyRepository.create(company, txn: txn);

        final worker = await _getWorkerModified(company.uid);
        await _workerRepository.updateWorker(worker, txn: txn);
      },
      onSuccess: navigate.toHome,
    );
  }

  CompanyModel get _newCompany => CompanyModel(
        uid: _companyRepository.generateId,
        ownerUid: authRepo.user!.uid,
        name: getFieldValue(FieldKeys.name),
        address: getFieldValue(FieldKeys.address),
        city: getFieldValue(FieldKeys.city),
        province: getFieldValue(FieldKeys.province),
        country: getFieldValue(FieldKeys.country),
        phone: getFieldValue(FieldKeys.phone),
      );

  Future<WorkerModel> _getWorkerModified(String companyId) async {
    final WorkerModel? worker = await _workerRepository.get(authRepo.user!.uid);

    if (worker == null) throw WorkerNotFoundException();

    worker.companyId = companyId;
    worker.role = WorkerRole.owner;

    return worker;
  }
}
