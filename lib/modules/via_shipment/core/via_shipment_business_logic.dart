import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/worker/module.dart';

import '../module.dart';

class ViaShipmentBusinessLogic with GlobalHelper implements IViaShipmentBusinessLogic {
  late final IViaShipmentRepository _viaShipmentRepo = Get.find();
  late final ICompanyBusinessLogic _companyBusinessLogic = Get.find();
  late final IWorkerBusinessLogic _workerBusinessLogic = Get.find();

  final _viaShipmentList$ = RxList<ViaShipmentModel>();
  StreamSubscription<List<ViaShipmentModel>>? _viaShipmentListSubscription;

  @override
  RxList<ViaShipmentModel> get viaShipmentList$ => _viaShipmentList$;

  @override
  Future<ViaShipmentModel?> get(String id) async => _viaShipmentRepo.get(id);

  @override
  Future<void> createViaShipment(ViaShipmentModel viaShipment) async =>
      await _viaShipmentRepo.create(viaShipment.copyWith(id: _viaShipmentRepo.generateId));

  @override
  Future<void> updateViaShipment(ViaShipmentModel viaShipment) async => await _viaShipmentRepo.update(viaShipment);

  @override
  Future<void> deleteViaShipment(String id) async => await _viaShipmentRepo.delete(id);

  @override
  Future<void> postCreateViaShipment() async => navigate.toViaShipmentList();

  @override
  Future<void> postUpdateViaShipment() async => navigate.toViaShipmentList();

  @override
  Future<void> initializeViaShipmentStream() async => _viaShipmentListSubscription = _viaShipmentRepo
      .viaShipmentListStream(_companyBusinessLogic.currentCompanyId)
      .listen((viaShipmentList) => _viaShipmentList$.value = viaShipmentList);

  @override
  Future<void> initializePaginatedViaShipmentStream({
    DocumentSnapshot? startAfter,
    int limit = 20,
  }) async {
    await _workerBusinessLogic.fetchLoggedWorker();
    await _companyBusinessLogic.fetchLoggedCompany();

    _viaShipmentListSubscription?.cancel();

    _viaShipmentListSubscription = _viaShipmentRepo
        .viaShipmentListPaginatedStream(_companyBusinessLogic.currentCompanyId, startAfter: startAfter, limit: limit)
        .listen(
      (viaShipmentList) {
        if (startAfter == null) {
          _viaShipmentList$.value = viaShipmentList;
        } else {
          _viaShipmentList$.addAll(viaShipmentList);
        }
      },
    );
  }

  @override
  void cancelViaShipmentStream() {
    _viaShipmentListSubscription?.cancel();
    _viaShipmentList$.clear();
  }
}
