import '../../../module.dart';

abstract class IVendorService {
  List<VendorModel> get vendorList$;

  Future<VendorModel?> get(String id);
  Future<void> create(VendorModel vendor);
  Future<void> update(VendorModel vendor);
  Future<void> delete(String id);
  Future<void> initializeStream();
  void cancelStream();
}
