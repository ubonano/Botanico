import '../../vendor_model.dart';

abstract class IVendorService {
  List<VendorModel> get vendorList$;
  Future<void> createVendor(VendorModel vendor);
  Future<void> initializeVendorStream();
  void cancelVendorStream();
}
