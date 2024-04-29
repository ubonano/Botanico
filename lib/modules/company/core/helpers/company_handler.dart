import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/company/company_module.dart';
import 'package:botanico/modules/foundation/core/mixins/global_services.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CompanyHandler with GlobalServices, AuthenticationContext, WorkerContext, CompanyContext {
  late final WorkerHandler _workerHandler = Get.find();

  Future<void> createCompany(CompanyModel company, Transaction? txn) async {
    String newCompanyId = companyRepo.generateId;
    String ownerUid = authRepo.user!.uid;

    await companyRepo.create(company.copyWith(uid: newCompanyId, ownerUid: ownerUid), txn: txn);

    await _workerHandler.updateWorkerAsOwner(newCompanyId, txn);
  }

  Future<void> postCreateCompany() async {
    await workerRepo.fetch(authRepo.user!.uid);
    navigate.toHome();
  }
}
