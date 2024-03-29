import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../module.dart';

class CompanyService extends GetxService with LifeCycleLogService, ContextService {
  @override
  String get logTag => 'CompanyService';

  late final CompanyRepository _companyRepository = Get.find();
  late final WorkerService _workerService = Get.find();

  String get _generateId => _companyRepository.generateId();

  Future<CompanyModel?> get(String id) async => await _companyRepository.get(id);

  Future<void> create(CompanyModel company, {Transaction? txn}) async {
    final newCompany = company.copyWith(uid: _generateId, ownerUid: session.userUID);
    await _companyRepository.create(newCompany, txn: txn);
    await _workerService.linkWorker(session.worker!, newCompany.uid, WorkerRole.owner, txn: txn);
  }

  Future<void> update(CompanyModel company, {Transaction? txn}) async =>
      await _companyRepository.update(company, txn: txn);
}
