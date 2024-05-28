import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/worker/module.dart';

import '../module.dart';

class ViaShipmentBusinessLogic with GlobalHelper implements IViaShipmentBusinessLogic {
  late final IViaShipmentRepository _viaShipmentRepo = Get.find();
  late final IViaCargoRepository _viaCargoRepo = Get.find();
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
  Future<void> initializePaginatedViaShipmentStream_V2({
    required RxList<ViaShipmentModel> list$,
    required StreamSubscription<List<ViaShipmentModel>>? subscription,
    DocumentSnapshot? startAfter,
    int limit = 20,
    List<ViaShipmentState>? states,
  }) async {
    subscription?.cancel();

    await _workerBusinessLogic.fetchLoggedWorker();
    await _companyBusinessLogic.fetchLoggedCompany();

    subscription = _viaShipmentRepo
        .viaShipmentListPaginatedStream(_companyBusinessLogic.currentCompanyId,
            startAfter: startAfter, limit: limit, states: states)
        .listen(
      (viaShipmentList) {
        if (startAfter == null) {
          list$.value = viaShipmentList;
        } else {
          list$.addAll(viaShipmentList);
        }
      },
    );
  }

  @override
  Future<ViaShipmentModel?> getShipmentFromExternalAPI(String shipmentId) async {
    final token = await _viaCargoRepo.getToken();

    if (token != null) {
      final trackingData = await _viaCargoRepo.getTrackingData(numeroEnvio: shipmentId);

      if (trackingData != null) {
        return trackingData;
      } else {
        throw Exception('Error al obtener los datos de tracking');
      }
    } else {
      throw Exception('Error al obtener el token');
    }
  }

  @override
  void cancelViaShipmentStream() {
    _viaShipmentListSubscription?.cancel();
    _viaShipmentList$.clear();
  }
}
