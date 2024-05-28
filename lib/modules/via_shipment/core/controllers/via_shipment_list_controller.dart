import 'dart:async';

import 'package:botanico/modules/foundation/module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../module.dart';

class ViaShipmentListController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'ViaShipmentListController';

  late final IViaShipmentService _viaShipmentService = Get.find();
  final ScrollController scrollController = ScrollController();

  final list$ = RxList<ViaShipmentModel>();
  StreamSubscription<List<ViaShipmentModel>>? _subscription;

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
    _viaShipmentService
        .initializePaginatedViaShipmentStream_V2(
            list$: list$, subscription: _subscription, startAfter: null, limit: _paginationLimit)
        .then((_) {
      if (list$.isNotEmpty) {
        _lastDocumentSnapshot = list$.last.documentSnapshot;
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
    _viaShipmentService
        .initializePaginatedViaShipmentStream_V2(
            list$: list$, subscription: _subscription, startAfter: _lastDocumentSnapshot, limit: _paginationLimit)
        .then((_) {
      if (list$.isNotEmpty) {
        _lastDocumentSnapshot = list$.last.documentSnapshot;
      }
      _isLoading = false;
    });
  }

  @override
  void onClose() {
    _subscription?.cancel();

    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.onClose();
  }
}
