import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/company/company_module.dart';
import 'package:botanico/modules/foundation/core/mixins/global_services.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../repositories/company_repository.dart';

class CompanyHandler with GlobalServices {
  late final CompanyRepository _companyRepo = Get.find();

  late final AuthenticationHandler _authHandler = Get.find();
  late final WorkerHandler _workerHandler = Get.find();

  CompanyModel? get currentCompany$ => _companyRepo.currentCompany$;

  Future<void> createCompany(CompanyModel company, Transaction? txn) async {
    String newCompanyId = _companyRepo.generateId;
    String ownerUid = _authHandler.currentUser!.uid;

    await _companyRepo.create(company.copyWith(uid: newCompanyId, ownerUid: ownerUid), txn: txn);

    await _workerHandler.updateWorkerAsOwner(newCompanyId, txn);
  }

  Future<void> postCreateCompany() async {
    await _workerHandler.fetchLoggedWorker();
    navigate.toHome();
  }

  Future<CompanyModel?> get(String id) async => _companyRepo.get(id);

  Future<CompanyModel?> fetch(String id) async => _companyRepo.fetch(id);

  void clearCurrentCompany() => _companyRepo.clearCurrentCompany();
}
