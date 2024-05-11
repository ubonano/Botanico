import 'dart:async';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';

import '../module.dart';

class VendorBusinessLogic extends GetxService with GlobalHelper implements IVendorBusinessLogic {
  late final IVendorRepository _vendorRepo = Get.find();
  late final ICompanyBusinessLogic _companyBusinessLogic = Get.find();

  final _vendorList$ = RxList<VendorModel>();
  StreamSubscription<List<VendorModel>>? _vendorListSubscription;

  @override
  RxList<VendorModel> get vendorList$ => _vendorList$;

  @override
  Future<void> createVendor(VendorModel vendor) async =>
      await _vendorRepo.create(vendor.copyWith(uid: _vendorRepo.generateId));

  @override
  Future<void> postCreateVendor() async => navigate.toVendorList();

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
