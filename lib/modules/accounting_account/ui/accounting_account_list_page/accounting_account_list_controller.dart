import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../app/helpers/life_cycle_logging_controller_helper.dart';
import '../../../app/helpers/paginated_list_helper.dart';
import '../../../company/setup/interfaces/i_company_service.dart';
import '../../../worker/setup/interfaces/i_worker_service.dart';
import '../../lib/setup/interfaces/i_accounting_account_service.dart';

class AccountingAccountListController extends GetxController
    with PaginatedListHelper<AccountingAccountModel>, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'AccountingAccountListController';

  late final IAccountingAccountService _accountingAccountService = Get.find();

  late final IWorkerService _workerService = Get.find();
  late final ICompanyService _companyService = Get.find();

  @override
  Future<void> onInit() async {
    await _workerService.fetchLoggedWorker();
    await _companyService.fetchLoggedCompany();

    super.onInit();
  }

  @override
  StreamSubscription<List<AccountingAccountModel>>? initStream({
    required RxList<AccountingAccountModel> list$,
    DocumentSnapshot? startAfter,
    required int limit,
    required Function(List<AccountingAccountModel>) onNewData,
  }) =>
      _accountingAccountService.initStream(
        list$: list$,
        startAfter: startAfter,
        limit: limit,
        onNewData: onNewData,
      );
}
