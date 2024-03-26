import 'package:botanico/services/company_service.dart';
import 'package:get/get.dart';
import '../../controllers/session_controller.dart';
import '../../services/navigation_service.dart';
import '../../services/worker_service.dart';
import '../../services/async_operation_service.dart';
import '../../utils/life_cycle_log_controller.dart';
import '../../controllers/form_controller.dart';
import '../../models/company_model.dart';
import '../../models/enums/worker_role.dart';
import '../../services/linked_worker_service.dart';

class CompanyCreateController extends FormController with LifeCycleLogController {
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

  late final AsyncOperationService _async = Get.find();
  late final NavigationService _navigate = Get.find();
  late final SessionController _session = Get.find();
  late final WorkerService _workerService = Get.find();
  late final CompanyService _companyService = Get.find();
  late final LinkedWorkerService _linkedWorkerService = Get.find();

  Future<void> createCompany() async {
    if (validateForm()) {
      await _async.perform(
        operationName: 'Create company',
        successMessage: 'Empresa creada',
        inTransaction: true,
        operation: (txn) async {
          final newCompany = CompanyModel(
            ownerUid: _session.userUID,
            name: getFieldValue('name'),
            address: getFieldValue('address'),
            city: getFieldValue('city'),
            province: getFieldValue('province'),
            country: getFieldValue('country'),
            phone: getFieldValue('phone'),
          );

          final companyCreated = await _companyService.create(newCompany, txn: txn);

          await _workerService.updateWorkerCompanyAndRole(
            _session.worker!,
            companyCreated.uid,
            WorkerRole.owner,
            txn: txn,
          );

          await _linkedWorkerService.linkWorkerToCompany(
            _session.worker!,
            companyCreated.uid,
            role: WorkerRole.owner,
            txn: txn,
          );
        },
        onSuccess: () async {
          await _session.fetchWorker();

          _navigate.toHome();
        },
      );
    }
  }
}
