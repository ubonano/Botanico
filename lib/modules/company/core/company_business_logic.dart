import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/worker/module.dart';

import '../module.dart';

class CompanyBusinessLogic extends GetxService implements ICompanyBusinessLogic {
  late final ICompanyRepository _companyRepo = Get.find();

  late final IAuthenticationBusinessLogic _authBusinessLogic = Get.find();
  late final IWorkerBusinessLogic _workerBusinessLogic = Get.find();

  final Rx<CompanyModel?> _currentCompany$ = Rx<CompanyModel?>(null);

  @override
  CompanyModel? get currentCompany$ => _currentCompany$.value;

  @override
  Future<CompanyModel?> get(String id) async => _companyRepo.get(id);

  @override
  Future<void> create(CompanyModel company, {Transaction? txn}) async {
    String newCompanyId = _companyRepo.generateId;
    String ownerUid = _authBusinessLogic.currentUser!.uid;

    await _companyRepo.create(
      company.copyWith(
        uid: newCompanyId,
        ownerUid: ownerUid,
        activeModules: {
          'company': true,
          'worker': true,
        },
      ),
      txn: txn,
    );

    await _workerBusinessLogic.updateWorkerAsOwner(newCompanyId, txn);
  }

  @override
  Future<void> update(CompanyModel company, {Transaction? txn}) async => await _companyRepo.update(company, txn: txn);

  @override
  Future<CompanyModel?> fetchLoggedCompany() async {
    String id = _workerBusinessLogic.loggedWorker$!.companyId;
    _currentCompany$.value = await get(id);
    return _currentCompany$.value;
  }

  @override
  void clearCurrentCompany() => _currentCompany$.value = null;
}
