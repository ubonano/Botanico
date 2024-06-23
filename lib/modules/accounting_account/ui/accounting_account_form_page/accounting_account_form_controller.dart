import 'package:get/get.dart';

import '../../../app/setup/fields_key.dart';
import '../../../app/helpers/form_helper.dart';
import '../../../app/setup/global_helper.dart';
import '../../../app/helpers/life_cycle_logging_controller_helper.dart';
import '../../lib/setup/interfaces/i_accounting_account_service.dart';

class AccountingAccountFormController extends GetxController
    with FormHelper<AccountingAccountModel>, GlobalHelper, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'AccountingAccountFormController';

  late final IAccountingAccountService _accountingAccountService = Get.find();

  @override
  List<String> formFields = [FieldKeys.name, FieldKeys.observations];

  @override
  Future<void> populateFormFields() async {
    modelForUpdate = await _accountingAccountService.get(modelId);

    if (modelForUpdate != null) {
      setFieldValue(FieldKeys.name, modelForUpdate!.name);
      setFieldValue(FieldKeys.observations, modelForUpdate!.observations);
    }
  }

  @override
  Future<void> submit() async {
    try {
      isUpdateMode
          ? await _accountingAccountService.update(buildModel())
          : await _accountingAccountService.create(buildModel());

      navigate.back();
    } catch (e) {
      isUpdateMode;
    }
  }

  @override
  AccountingAccountModel buildModel() => AccountingAccountModel(
        uid: isUpdateMode ? modelForUpdate!.uid : '',
        name: getFieldValue(FieldKeys.name),
        observations: getFieldValue(FieldKeys.observations),
      );
}
