import 'package:botanico/utils/custom_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../models/company_model.dart';

class CompanyCreateController extends GetxController with CustomController {
  @override
  String get logTag => 'CompanyCreateController';

  final formKey = GlobalKey<FormState>();

  final nameCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final cityCtrl = TextEditingController();
  final provinceCtrl = TextEditingController();
  final countryCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();

  String get _name => nameCtrl.text.trim();
  String get _address => addressCtrl.text.trim();
  String get _city => cityCtrl.text.trim();
  String get _province => provinceCtrl.text.trim();
  String get _country => countryCtrl.text.trim();
  String get _phone => phoneCtrl.text.trim();

  CompanyModel _newCompany() => CompanyModel(
        ownerUid: loggedUserUID,
        name: _name,
        address: _address,
        city: _city,
        province: _province,
        country: _country,
        phone: _phone,
      );

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) return;

    await async.perform(
      operationName: 'Create company',
      successMessage: 'Empresa creada!',
      inTransaction: true,
      operation: (txn) async {
        final newCompany = await companyService.create(_newCompany(), txn: txn);

        await updateWorkerWithCompanyId(newCompany.uid, txn);
      },
      onSuccess: () async {
        await fetchWorker();
        await fetchCompany();

        navigate.toHome();
      },
    );
  }

  Future<void> updateWorkerWithCompanyId(String companyId, txn) async {
    await workerService.update(worker!.copyWith(companyId: companyId), txn: txn);
  }

  @override
  void onClose() {
    disposeControllers();

    super.onClose();
  }

  void disposeControllers() {
    nameCtrl.dispose();
    addressCtrl.dispose();
    cityCtrl.dispose();
    provinceCtrl.dispose();
    countryCtrl.dispose();
    phoneCtrl.dispose();
  }
}
