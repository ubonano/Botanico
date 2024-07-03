import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../app/content/helpers/life_cycle_logging_controller_helper.dart';
import '../../../../app/content/helpers/paginated_list_helper.dart';
import '../../../setup/interfaces/i_accounting_account_service.dart';

class AccountingAccountListController extends GetxController
    with PaginatedListHelper<AccountingAccountModel>, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'AccountingAccountListController';

  late final IAccountingAccountService _accountingAccountService = Get.find();

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
