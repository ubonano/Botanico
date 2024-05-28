import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../module.dart';

class ViaShipmentService extends GetxService with GlobalHelper implements IViaShipmentService {
  late final IViaShipmentBusinessLogic _viaShipmentBusinessLogic = Get.find();

  @override
  List<ViaShipmentModel> get viaShipmentList$ => _viaShipmentBusinessLogic.viaShipmentList$;

  @override
  Future<ViaShipmentModel?> get(String id) async => await _viaShipmentBusinessLogic.get(id);

  @override
  Future<void> createViaShipment(ViaShipmentModel viaShipment) async => await operation.perform(
        operationName: 'Create via shipment',
        permissionKey: ViaShipmentModulePermissions.createKey,
        operation: (_) async => await _viaShipmentBusinessLogic.createViaShipment(viaShipment),
        onSuccess: _viaShipmentBusinessLogic.postCreateViaShipment,
      );

  @override
  Future<void> updateViaShipment(ViaShipmentModel viaShipment) async => await operation.perform(
        operationName: 'Update via shipment',
        permissionKey: ViaShipmentModulePermissions.updateKey,
        operation: (_) async => await _viaShipmentBusinessLogic.updateViaShipment(viaShipment),
        onSuccess: _viaShipmentBusinessLogic.postUpdateViaShipment,
      );

  @override
  Future<void> deleteViaShipment(String id) async => await operation.perform(
        operationName: 'Delete via shipment',
        permissionKey: ViaShipmentModulePermissions.deleteKey,
        inTransaction: true,
        operation: (_) async => await _viaShipmentBusinessLogic.deleteViaShipment(id),
      );

  @override
  StreamSubscription<List<ViaShipmentModel>>? initializeViaShipmentStream({
    required RxList<ViaShipmentModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    List<ViaShipmentState>? states,
    Function(List<ViaShipmentModel>)? onNewData,
  }) =>
      _viaShipmentBusinessLogic.initializeViaShipmentStream(
        list$: list$,
        startAfter: startAfter,
        limit: limit,
        states: states,
        onNewData: onNewData,
      );

  @override
  Future<ViaShipmentModel?> getShipmentFromExternalAPI(String shipmentId) async => await operation.perform(
        operationName: 'Get shipment from External API',
        errorMessage: 'Error al obtener el envío',
        operation: (_) async => _viaShipmentBusinessLogic.getShipmentFromExternalAPI(shipmentId),
      );

  @override
  void cancelViaShipmentStream() => _viaShipmentBusinessLogic.cancelViaShipmentStream();
}
