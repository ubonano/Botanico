import 'package:get/get.dart';
import '../../utils/custom_controller.dart';
import '../../utils/form_controller.dart';
import '../../models/company_model.dart';
import '../../models/enums/worker_role.dart';
import '../../services/linked_worker_service.dart';

class CompanyCreateController extends FormController with CustomController {
  @override
  String get logTag => 'CompanyCreateController';

  @override
  List<String> formFields = [
    'name',
    'address',
    'city',
    'province',
    'country',
    'phone',
  ];

  late final LinkedWorkerService _linkedWorkerService = Get.find();

  Future<void> createCompany() async {
    if (validateForm()) {
      await async.perform(
        operationName: 'Create company',
        successMessage: 'Empresa creada',
        inTransaction: true,
        operation: (txn) async {
          final newCompany = CompanyModel(
            ownerUid: currentUserUID,
            name: getFieldValue('name'),
            address: getFieldValue('address'),
            city: getFieldValue('city'),
            province: getFieldValue('province'),
            country: getFieldValue('country'),
            phone: getFieldValue('phone'),
          );

          final companyCreated = await companyService.create(newCompany, txn: txn);

          await workerService.updateWorkerWithCompanyId(currentWorker!, companyCreated.uid, txn: txn);
          await _linkedWorkerService.linkWorkerToCompany(
            currentWorker!,
            companyCreated.uid,
            WorkerRole.owner,
            txn: txn,
          );
        },
        onSuccess: () async {
          await fetchWorker();
          await fetchCompany();

          navigate.toHome();
        },
      );
    }
  }
}
