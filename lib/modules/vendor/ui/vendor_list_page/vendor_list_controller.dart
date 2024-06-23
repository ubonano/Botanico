import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../company/helpers/life_cycle_logging_controller_helper.dart';
import '../../../company/helpers/paginated_list_helper.dart';
import '../../../company/setup/interfaces/i_company_service.dart';
import '../../../worker/setup/interfaces/i_worker_service.dart';
import '../../setup/interfaces/i_vendor_service.dart';

class VendorListController extends GetxController
    with PaginatedListHelper<VendorModel>, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'VendorListController';

  late final IVendorService _vendorService = Get.find();

  late final IWorkerService _workerService = Get.find();
  late final ICompanyService _companyService = Get.find();

  @override
  Future<void> onInit() async {
    await _workerService.fetchLoggedWorker();
    await _companyService.fetchLoggedCompany();

    super.onInit();
  }

  @override
  StreamSubscription<List<VendorModel>>? initStream({
    required RxList<VendorModel> list$,
    DocumentSnapshot? startAfter,
    required int limit,
    required Function(List<VendorModel>) onNewData,
  }) =>
      _vendorService.initStream(
        list$: list$,
        startAfter: startAfter,
        limit: limit,
        onNewData: onNewData,
      );
}
