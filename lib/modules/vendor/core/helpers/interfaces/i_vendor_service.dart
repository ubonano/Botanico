import '../../../module.dart';

abstract class IVendorService {
  List<VendorModel> get vendorList$;
  Future<void> createVendor(VendorModel vendor);
  Future<void> deleteVendor(String id);
  Future<void> initializeVendorStream();
  void cancelVendorStream();
}
