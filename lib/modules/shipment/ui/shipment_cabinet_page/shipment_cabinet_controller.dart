import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../app/content/helpers/life_cycle_logging_controller_helper.dart';
import '../../../app/content/helpers/paginated_list_helper.dart';
import '../../../company/setup/interfaces/i_company_service.dart';
import '../../../worker/content/setup/interfaces/i_worker_service.dart';
import '../../setup/interfaces/i_shipment_service.dart';

class ShipmentCabinetController extends GetxController
    with PaginatedListHelper<ShipmentModel>, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'ShipmentCabinetController';

  late final IShipmentService _shipmentService = Get.find();

  late final IWorkerService _workerService = Get.find();
  late final ICompanyService _companyService = Get.find();

  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController shipmentIdController = TextEditingController();

  @override
  Future<void> onInit() async {
    await _workerService.fetchCurrentWorker();
    await _companyService.fetchLoggedCompany();

    super.onInit();
  }

  @override
  StreamSubscription<List<ShipmentModel>>? initStream({
    required RxList<ShipmentModel> list$,
    DocumentSnapshot? startAfter,
    required int limit,
    required Function(List<ShipmentModel>) onNewData,
  }) =>
      _shipmentService.initStream(
        list$: list$,
        startAfter: startAfter,
        limit: limit,
        states: [ShipmentState.archived],
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
