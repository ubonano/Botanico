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

  final int _paginationLimit = 20;
  bool _isLoading = false;

  @override
  void onInit() {
    super.onInit();
    _initializeViaShipmentStream();
    scrollController.addListener(_scrollListener);
  }

  void _initializeViaShipmentStream() {
    _isLoading = true;
    _viaShipmentBusinessLogic.initializePaginatedViaShipmentStream(startAfter: null, limit: _paginationLimit).then((_) {
      if (viaShipmentList$.isNotEmpty) {
        _lastDocumentSnapshot = viaShipmentList$.last.documentSnapshot;
      }
      _isLoading = false;
    });
  }

  void _scrollListener() {
    if (!_isLoading && scrollController.position.extentAfter < 300) {
      _isLoading = true;
      loadNextPage();
    }
  }

  void loadNextPage() {
    _viaShipmentBusinessLogic
        .initializePaginatedViaShipmentStream(startAfter: _lastDocumentSnapshot, limit: _paginationLimit)
        .then((_) {
      if (viaShipmentList$.isNotEmpty) {
        _lastDocumentSnapshot = viaShipmentList$.last.documentSnapshot;
      }
      _isLoading = false;
    });
  }

  @override
  void onClose() {
    _viaShipmentBusinessLogic.cancelViaShipmentStream();
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.onClose();
  }
}
