import 'package:botanico/modules/foundation/module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../module.dart';

class ViaShipmentListController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'ViaShipmentListController';

  late final IViaShipmentBusinessLogic _viaShipmentBusinessLogic = Get.find();
  final ScrollController scrollController = ScrollController();

  RxList<ViaShipmentModel> get viaShipmentList$ => _viaShipmentBusinessLogic.viaShipmentList$;

  DocumentSnapshot? _lastDocumentSnapshot;

  double _scrollPosition = 0;

  @override
  void onInit() {
    super.onInit();
    _initializeViaShipmentStream();
    scrollController.addListener(_scrollListener);
  }

  void _initializeViaShipmentStream() {
    _viaShipmentBusinessLogic.initializePaginatedViaShipmentStream(startAfter: null, limit: 20).then((_) {
      if (viaShipmentList$.isNotEmpty) {
        _lastDocumentSnapshot = viaShipmentList$.last.documentSnapshot;
      }
    });
  }

  void _scrollListener() {
    if (scrollController.position.extentAfter < 5) {
      _scrollPosition = scrollController.position.pixels;

      loadNextPage();
    }
  }

  void loadNextPage() {
    _viaShipmentBusinessLogic.initializePaginatedViaShipmentStream(startAfter: _lastDocumentSnapshot, limit: 20).then(
      (_) {
        if (viaShipmentList$.isNotEmpty) {
          _lastDocumentSnapshot = viaShipmentList$.last.documentSnapshot;
          Future.delayed(const Duration(milliseconds: 100), () {
            scrollController.jumpTo(_scrollPosition);
          });
        }
      },
    );
  }

  @override
  void onClose() {
    _viaShipmentBusinessLogic.cancelViaShipmentStream();
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.onClose();
  }
}
