import 'dart:async';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';

import '../module.dart';

class VendorBusinessLogic with GlobalHelper implements IVendorBusinessLogic {
  late final IVendorRepository _vendorRepo = Get.find();
  late final ICompanyBusinessLogic _companyBusinessLogic = Get.find();

  final _vendorList$ = RxList<VendorModel>();
  StreamSubscription<List<VendorModel>>? _vendorListSubscription;

  @override
  RxList<VendorModel> get vendorList$ => _vendorList$;

  @override
  Future<VendorModel?> get(String id) async => _vendorRepo.get(id);

  @override
  Future<void> createVendor(VendorModel vendor) async =>
      await _vendorRepo.create(vendor.copyWith(uid: _vendorRepo.generateId));

  @override
  Future<void> updateVendor(VendorModel vendor) async => await _vendorRepo.update(vendor);

  @override
  Future<void> deleteVendor(String id) async => await _vendorRepo.delete(id);

  @override
  Future<void> postCreateVendor() async => navigate.toVendorList();

  @override
  Future<void> postUpdateVendor() async => navigate.toVendorList();

  @override
  Future<void> initializeVendorStream() async => _vendorListSubscription = _vendorRepo
      .vendorListStream(_companyBusinessLogic.currentCompanyId)
      .listen((workerList) => _vendorList$.value = workerList);

  @override
  void cancelVendorStream() {
    _vendorListSubscription?.cancel();
    _vendorList$.clear();
  }
}
