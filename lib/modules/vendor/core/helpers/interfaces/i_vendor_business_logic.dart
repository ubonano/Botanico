import 'package:get/get.dart';

import '../../vendor_model.dart';

abstract class IVendorBusinessLogic {
  RxList<VendorModel> get vendorList$;

  Future<VendorModel?> get(String id);
  Future<void> create(VendorModel vendor);
  Future<void> update(VendorModel vendor);
  Future<void> delete(String id);
  Future<void> postCreate();
  Future<void> postUpdate();
  Future<void> initializeStream();
  void cancelStream();
}
