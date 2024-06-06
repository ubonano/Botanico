import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../module.dart';

class VendorService extends GetxService with GlobalHelper implements IVendorService {
  late final IVendorBusinessLogic _vendorBusinessLogic = Get.find();

  @override
  List<VendorModel> get vendorList$ => _vendorBusinessLogic.vendorList$;

  @override
  Future<VendorModel?> get(String id) async => await _vendorBusinessLogic.get(id);

  @override
  Future<void> create(VendorModel vendor) async {
    await operation.perform(
      operationName: 'Create vendor',
      permissionKey: VendorModulePermissions.createKey,
      operation: (_) async => await _vendorBusinessLogic.create(vendor),
      onSuccess: _vendorBusinessLogic.postCreate,
    );
  }

  @override
  Future<void> update(VendorModel vendor) async {
    await operation.perform(
      operationName: 'Update vendor',
      permissionKey: VendorModulePermissions.updateKey,
      operation: (_) async => await _vendorBusinessLogic.update(vendor),
      onSuccess: _vendorBusinessLogic.postUpdate,
    );
  }

  @override
  Future<void> delete(String id) async {
    await operation.perform(
      operationName: 'Delete vendor',
      permissionKey: VendorModulePermissions.deleteKey,
      successMessage: 'Proveedor eliminado',
      inTransaction: true,
      operation: (_) async => await _vendorBusinessLogic.delete(id),
    );
  }

  @override
  Future<void> initializeStream() async {
    await operation.perform(
      operationName: 'Fetch vendor',
      permissionKey: VendorModulePermissions.viewKey,
      operation: (_) async => await _vendorBusinessLogic.initializeStream(),
    );
  }

  @override
  void cancelStream() => _vendorBusinessLogic.cancelStream();
}
