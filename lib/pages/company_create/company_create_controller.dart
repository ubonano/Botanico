import 'package:botanico/utils/custom_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../models/company_model.dart';
import '../../models/enums/worker_role.dart';
import '../../services/linked_worker_service.dart';

class CompanyCreateController extends GetxController with CustomController {
  @override
  String get logTag => 'CompanyCreateController';

  @override
  // ignore: overridden_fields
  Map<String, TextEditingController> textControllers = {
    'name': TextEditingController(),
    'address': TextEditingController(),
    'city': TextEditingController(),
    'province': TextEditingController(),
    'country': TextEditingController(),
    'phone': TextEditingController(),
  };

  late final LinkedWorkerService _linkedWorkerService = Get.find();

  final formKey = GlobalKey<FormState>();

  Future<void> createCompany() async {
    if (!formKey.currentState!.validate()) return;

    await async.perform(
      operationName: 'Create company',
      successMessage: 'Empresa creada',
      inTransaction: true,
      operation: (txn) async {
        final newCompany = CompanyModel(
          ownerUid: loggedUserUID,
          name: getFieldValue('name'),
          address: getFieldValue('address'),
          city: getFieldValue('city'),
          province: getFieldValue('province'),
          country: getFieldValue('country'),
          phone: getFieldValue('phone'),
        );

        final companyCreated = await companyService.create(newCompany, txn: txn);

        await workerService.updateWorkerWithCompanyId(currentWorker!, companyCreated.uid, txn: txn);
        await _linkedWorkerService.linkWorkerToCompany(currentWorker!, companyCreated.uid, WorkerRole.owner, txn: txn);
      },
      onSuccess: () async {
        await fetchWorker();
        await fetchCompany();

        navigate.toHome();
      },
    );
  }
}
