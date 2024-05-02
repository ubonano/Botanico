import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/company/company_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CompanyBusinessLogic extends GetxService with GlobalServices implements ICompanyBusinessLogic {
  late final ICompanyRepository _companyRepo = Get.find();

  late final IAuthenticationBusinessLogic _authBusinessLogic = Get.find();
  late final WorkerHandler _workerHandler = Get.find();

  final Rx<CompanyModel?> _currentCompany$ = Rx<CompanyModel?>(null);
  @override
  CompanyModel? get currentCompany$ => _currentCompany$.value;

  @override
  Future<void> createCompany(CompanyModel company, Transaction? txn) async {
    String newCompanyId = _companyRepo.generateId;
    String ownerUid = _authBusinessLogic.currentUser!.uid;

    await _companyRepo.create(company.copyWith(uid: newCompanyId, ownerUid: ownerUid), txn: txn);

    await _workerHandler.updateWorkerAsOwner(newCompanyId, txn);
  }

  @override
  Future<void> postCreateCompany() async {
    await _workerHandler.fetchLoggedWorker();
    navigate.toHome();
  }

  @override
  Future<CompanyModel?> get(String id) async => _companyRepo.get(id);

  @override
  Future<CompanyModel?> fetch(String id) async {
    if (id.isEmpty) return null;
    _currentCompany$.value = await get(id);
    return _currentCompany$.value;
  }

  @override
  void clearCurrentCompany() => _currentCompany$.value = null;
}
