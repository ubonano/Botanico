import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../app/content/helpers/life_cycle_logging_controller_helper.dart';
import '../../../../app/content/helpers/paginated_list_helper.dart';
import '../../../setup/interfaces/i_shipment_service.dart';

class ShipmentDashboardController extends GetxController
    with PaginatedListHelper<ShipmentModel>, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'ShipmentDashboardController';

  @override
  int get paginationLimit => 100;

  late final IShipmentService _shipmentService = Get.find();

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
        states: [
          ShipmentState.pending,
          ShipmentState.inProcess,
          ShipmentState.ready,
          ShipmentState.delivered,
          ShipmentState.canceled
        ],
        descending: false,
        onNewData: onNewData,
      );
}
