import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../module.dart';

class VendorService extends GetxService with GlobalHelper implements IVendorService {
  late final IVendorBusinessLogic _vendorBusinessLogic = Get.find();

  @override
  List<VendorModel> get vendorList$ => _vendorBusinessLogic.vendorList$;

  @override
  Future<void> createVendor(VendorModel vendor) async {
    await operation.perform(
      operationName: 'Create vendor',
      operation: (_) async => await _vendorBusinessLogic.createVendor(vendor),
      onSuccess: _vendorBusinessLogic.postCreateVendor,
    );
  }

  @override
  Future<void> deleteVendor(String id) async {
    await operation.perform(
      operationName: 'Delete vendor',
      permissionKey: VendorModulePermissions.deleteKey,
      successMessage: 'Proveedor eliminado',
      inTransaction: true,
      operation: (_) async => await _vendorBusinessLogic.deleteVendor(id),
    );
  }

  @override
  Future<void> initializeVendorStream() async {
    await operation.perform(
      operationName: 'Fetch vendor',
      permissionKey: VendorModulePermissions.viewKey,
      operation: (_) async => await _vendorBusinessLogic.initializeVendorStream(),
    );
  }

  @override
  void cancelVendorStream() => _vendorBusinessLogic.cancelVendorStream();
}
