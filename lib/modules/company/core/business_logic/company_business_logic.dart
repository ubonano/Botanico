import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CompanyBusinessLogic extends GetxService with GlobalHelper implements ICompanyBusinessLogic {
  late final ICompanyRepository _companyRepo = Get.find();

  late final IAuthenticationBusinessLogic _authBusinessLogic = Get.find();
  late final IWorkerBusinessLogic _workerBusinessLogic = Get.find();

  final Rx<CompanyModel?> _currentCompany$ = Rx<CompanyModel?>(null);

  @override
  CompanyModel? get currentCompany$ => _currentCompany$.value;

  @override
  Future<void> createCompany(CompanyModel company, Transaction? txn) async {
    String newCompanyId = _companyRepo.generateId;
    String ownerUid = _authBusinessLogic.currentUserId;

    await _companyRepo.create(company.copyWith(uid: newCompanyId, ownerUid: ownerUid), txn: txn);

    await _workerBusinessLogic.updateWorkerAsOwner(newCompanyId, txn);
  }

  @override
  Future<void> postCreateCompany() async {
    await _workerBusinessLogic.fetchLoggedWorker();
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
