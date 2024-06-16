import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/worker/module.dart';

import '../../module.dart';

class ViaShipmentListController extends GetxController
    with PaginatedListHelper<ViaShipmentModel>, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'ViaShipmentListController';

  late final IViaShipmentService _viaShipmentService = Get.find();

  late final IWorkerService _workerService = Get.find();
  late final ICompanyService _companyService = Get.find();

  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController shipmentIdController = TextEditingController();

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
        fromDate: startDateController.text.isNotEmpty
            ? DateTime.parse(startDateController.text).toLocal().copyWith(hour: 0, minute: 0, second: 0, millisecond: 0)
            : null,
        toDate: endDateController.text.isNotEmpty
            ? DateTime.parse(endDateController.text)
                .toLocal()
                .copyWith(hour: 23, minute: 59, second: 59, millisecond: 999)
            : null,
        shipmentId: shipmentIdController.text != '' ? shipmentIdController.text : null,
        onNewData: onNewData,
      );

  void cleanFilters() {
    startDateController.clear();
    endDateController.clear();
    shipmentIdController.clear();
  }
}
