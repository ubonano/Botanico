import 'dart:async';

import 'package:botanico/modules/foundation/module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:botanico/modules/company/module.dart';

import '../../module.dart';

class ViaShipmentListController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'ViaShipmentListController';

  late final IWorkerService _workerService = Get.find();
  late final ICompanyService _companyService = Get.find();

  late final IViaShipmentService _viaShipmentService = Get.find();
  final ScrollController scrollController = ScrollController();

  final list$ = RxList<ViaShipmentModel>();
  StreamSubscription<List<ViaShipmentModel>>? _subscription;

  DocumentSnapshot? _lastDocumentSnapshot;

  final int _paginationLimit = 20;
  bool _isLoading = false;

  @override
  Future<void> onInit() async {
    super.onInit();

    await _workerService.fetchLoggedWorker();
    await _companyService.fetchLoggedCompany();

    _initializeViaShipmentStream();
    scrollController.addListener(_scrollListener);
  }

  void _initializeViaShipmentStream() {
    _isLoading = true;

    _subscription?.cancel();

    _subscription = _viaShipmentService.initializeStream(
      list$: list$,
      startAfter: null,
      limit: _paginationLimit,
      onNewData: _onNewData,
    );
  }

  void loadNextPage() {
    _subscription = _viaShipmentService.initializeStream(
      list$: list$,
      startAfter: _lastDocumentSnapshot,
      limit: _paginationLimit,
      onNewData: _onNewData,
    );
  }

  _onNewData(viaShipmentList) {
    if (list$.isNotEmpty) {
      _lastDocumentSnapshot = list$.last.documentSnapshot;
    }
    _isLoading = false;
  }

  void _scrollListener() {
    if (!_isLoading && scrollController.position.extentAfter < 300) {
      _isLoading = true;
      loadNextPage();
    }
  }

  @override
  void onClose() {
    _subscription?.cancel();

    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.onClose();
  }
}
