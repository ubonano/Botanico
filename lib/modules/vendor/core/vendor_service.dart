import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

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
  Future<void> initializeVendorStream() async {
    await operation.perform(
      operationName: 'Fetch workers',
      permissionKey: VendorModulePermissions.viewKey,
      operation: (_) async => await _vendorBusinessLogic.initializeVendorStream(),
    );
  }

  @override
  void cancelVendorStream() => _vendorBusinessLogic.cancelVendorStream();
}
