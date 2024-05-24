import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

import '../../module.dart';

class AccountingAccountFormController extends GetxController with FormHelper<AccountingAccountModel>, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'AccountingAccountFormController';

  late final IAccountingAccountService _accountingAccountService = Get.find();

  @override
  List<String> formFields = [
    FieldKeys.name,
    FieldKeys.observations,
  ];

  @override
  Future<void> populateFormFields() async {
    modelForUpdate = await _accountingAccountService.get(modelId);

    if (modelForUpdate != null) {
      setFieldValue(FieldKeys.name, modelForUpdate!.name);
      setFieldValue(FieldKeys.observations, modelForUpdate!.observations);
    }
  }

  @override
  Future<void> submit() async =>
      isUpdateMode ? await _accountingAccountService.updateAccountingAccount(buildModel()) : await _accountingAccountService.createAccountingAccount(buildModel());

  @override
  AccountingAccountModel buildModel() {
    return AccountingAccountModel(
      uid: isUpdateMode ? modelForUpdate!.uid : '',
      name: getFieldValue(FieldKeys.name),
      observations: getFieldValue(FieldKeys.observations),
    );
  }
}

