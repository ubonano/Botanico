import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../module.dart';

class ViaShipmentService extends GetxService with GlobalHelper implements IViaShipmentService {
  late final IViaShipmentBusinessLogic _viaShipmentBusinessLogic = Get.find();

  @override
  Future<ViaShipmentModel?> get(String id) async => await _viaShipmentBusinessLogic.get(id);

  @override
  Future<ViaShipmentModel?> getFromExternalAPI(String shipmentId) async => await operation.perform(
        operationName: 'Get shipment from External API',
        errorMessage: 'Error al obtener el envío',
        operation: (_) async => _viaShipmentBusinessLogic.getFromExternalAPI(shipmentId),
      );

  @override
  Future<void> create(ViaShipmentModel viaShipment) async => await operation.perform(
        operationName: 'Create via shipment',
        permissionKey: ViaShipmentModulePermissions.createKey,
        operation: (_) async => await _viaShipmentBusinessLogic.create(viaShipment),
        onSuccess: _viaShipmentBusinessLogic.postCreate,
      );

  @override
  Future<void> update(ViaShipmentModel viaShipment) async => await operation.perform(
        operationName: 'Update via shipment',
        permissionKey: ViaShipmentModulePermissions.updateKey,
        operation: (_) async => await _viaShipmentBusinessLogic.update(viaShipment),
        onSuccess: _viaShipmentBusinessLogic.postUpdate,
      );

  @override
  Future<void> delete(String id) async => await operation.perform(
        operationName: 'Delete via shipment',
        permissionKey: ViaShipmentModulePermissions.deleteKey,
        inTransaction: true,
        operation: (_) async => await _viaShipmentBusinessLogic.delete(id),
      );

  @override
  StreamSubscription<List<ViaShipmentModel>>? initializeStream({
    required RxList<ViaShipmentModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    List<ViaShipmentState>? states,
    Function(List<ViaShipmentModel>)? onNewData,
  }) =>
      _viaShipmentBusinessLogic.initializeStream(
        list$: list$,
        startAfter: startAfter,
        limit: limit,
        states: states,
        onNewData: onNewData,
      );
}
