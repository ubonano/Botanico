import 'package:get/get.dart';

import '../../vendor_model.dart';

abstract class IVendorBusinessLogic {
  RxList<VendorModel> get vendorList$;

  Future<VendorModel?> get(String id);
  Future<void> createVendor(VendorModel vendor);
  Future<void> updateVendor(VendorModel vendor);
  Future<void> deleteVendor(String id);
  Future<void> postCreateVendor();
  Future<void> postUpdateVendor();
  Future<void> initializeVendorStream();
  void cancelVendorStream();
}
