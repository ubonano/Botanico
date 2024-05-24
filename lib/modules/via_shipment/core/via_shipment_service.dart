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
  Future<void> createViaShipment(ViaShipmentModel viaShipment) async {
    await operation.perform(
      operationName: 'Create via shipment',
      permissionKey: ViaShipmentModulePermissions.createKey,
      operation: (_) async => await _viaShipmentBusinessLogic.createViaShipment(viaShipment),
      onSuccess: _viaShipmentBusinessLogic.postCreateViaShipment,
    );
  }

  @override
  Future<void> updateViaShipment(ViaShipmentModel viaShipment) async {
    await operation.perform(
      operationName: 'Update via shipment',
      permissionKey: ViaShipmentModulePermissions.updateKey,
      operation: (_) async => await _viaShipmentBusinessLogic.updateViaShipment(viaShipment),
      onSuccess: _viaShipmentBusinessLogic.postUpdateViaShipment,
    );
  }

  @override
  Future<void> deleteViaShipment(String id) async {
    await operation.perform(
      operationName: 'Delete via shipment',
      permissionKey: ViaShipmentModulePermissions.deleteKey,
      successMessage: 'Via shipment deleted',
      inTransaction: true,
      operation: (_) async => await _viaShipmentBusinessLogic.deleteViaShipment(id),
    );
  }

  @override
  Future<void> initializeViaShipmentStream() async {
    await operation.perform(
      operationName: 'Fetch via shipment',
      permissionKey: ViaShipmentModulePermissions.viewKey,
      operation: (_) async => await _viaShipmentBusinessLogic.initializeViaShipmentStream(),
    );
  }

  @override
  void cancelViaShipmentStream() => _viaShipmentBusinessLogic.cancelViaShipmentStream();
}
