import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/worker/module.dart';

import '../../module.dart';

class ViaShipmentDashboardController extends GetxController
    with PaginatedListHelper<ViaShipmentModel>, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'ViaShipmentDashboardController';

  @override
  int get paginationLimit => 100;

  late final IViaShipmentService _viaShipmentService = Get.find();

  late final IWorkerService _workerService = Get.find();
  late final ICompanyService _companyService = Get.find();

  @override
  Future<void> onInit() async {
    await _workerService.fetchLoggedWorker();
    await _companyService.fetchLoggedCompany();

    super.onInit();
  }

  @override
  StreamSubscription<List<ViaShipmentModel>>? initStream({
    required RxList<ViaShipmentModel> list$,
    DocumentSnapshot? startAfter,
    required int limit,
    required Function(List<ViaShipmentModel>) onNewData,
  }) =>
      _viaShipmentService.initStream(
        list$: list$,
        startAfter: startAfter,
        limit: limit,
        states: [
          ViaShipmentState.pending,
          ViaShipmentState.inProcess,
          ViaShipmentState.ready,
          ViaShipmentState.delivered
        ],
        descending: false,
        onNewData: onNewData,
      );
}
