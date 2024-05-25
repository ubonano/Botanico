import 'package:botanico/modules/foundation/module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../module.dart';

class ViaShipmentListController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'ViaShipmentListController';

  late final IViaShipmentBusinessLogic _viaShipmentBusinessLogic = Get.find();

  RxList<ViaShipmentModel> get viaShipmentList$ => _viaShipmentBusinessLogic.viaShipmentList$;

  DocumentSnapshot? _lastDocumentSnapshot;

  @override
  void onInit() {
    super.onInit();
    _initializeViaShipmentStream();
  }

  void _initializeViaShipmentStream() {
    _viaShipmentBusinessLogic.initializePaginatedViaShipmentStream(startAfter: null, limit: 5).then((_) {
      if (viaShipmentList$.isNotEmpty) {
        _lastDocumentSnapshot = viaShipmentList$.last.documentSnapshot;
      }
    });
  }

  void loadNextPage() {
    if (_lastDocumentSnapshot != null) {
      _viaShipmentBusinessLogic.initializePaginatedViaShipmentStream(startAfter: _lastDocumentSnapshot, limit: 5).then(
        (_) {
          if (viaShipmentList$.isNotEmpty) {
            _lastDocumentSnapshot = viaShipmentList$.last.documentSnapshot;
          }
        },
      );
    }
  }

  @override
  void onClose() {
    _viaShipmentBusinessLogic.cancelViaShipmentStream();
    super.onClose();
  }
}
