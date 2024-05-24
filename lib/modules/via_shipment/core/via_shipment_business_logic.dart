import 'dart:async';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';

import '../module.dart';

class ViaShipmentBusinessLogic with GlobalHelper implements IViaShipmentBusinessLogic {
  late final IViaShipmentRepository _viaShipmentRepo = Get.find();
  late final ICompanyBusinessLogic _companyBusinessLogic = Get.find();

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
  void cancelViaShipmentStream() {
    _viaShipmentListSubscription?.cancel();
    _viaShipmentList$.clear();
  }
}

