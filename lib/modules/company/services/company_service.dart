import 'package:botanico/modules/foundation/module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../module.dart';

class CompanyService extends GetxService with ContextService {
  late final CompanyRepository _companyRepository = Get.find();

  String get _generateId => _companyRepository.generateId();

  Future<CompanyModel?> get(String id) async => await _companyRepository.get(id);

  Future<void> create(CompanyModel company, {Transaction? txn}) async {
    final newCompany = company.copyWith(uid: _generateId, ownerUid: auth.user!.uid);
    await _companyRepository.create(newCompany, txn: txn);
  }

  Future<void> update(CompanyModel company, {Transaction? txn}) async =>
      await _companyRepository.update(company, txn: txn);
}
