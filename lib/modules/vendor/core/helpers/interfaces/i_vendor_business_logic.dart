import 'package:get/get.dart';

import '../../vendor_model.dart';

abstract class IVendorBusinessLogic {
  RxList<VendorModel> get vendorList$;
  Future<void> createVendor(VendorModel vendor);
  Future<void> postCreateVendor();
  Future<void> initializeVendorStream();
  void cancelVendorStream();
}
