import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';

import '../module.dart';

class VendorBusinessLogic with GlobalHelper implements IVendorBusinessLogic {
  late final IVendorRepository _vendorRepo = Get.find();
  late final ICompanyBusinessLogic _companyBusinessLogic = Get.find();

  @override
  Future<VendorModel?> get(String id) async => _vendorRepo.get(id);

  @override
  Future<void> create(VendorModel vendor) async =>
      await _vendorRepo.create(vendor.copyWith(uid: _vendorRepo.generateId));

  @override
  Future<void> update(VendorModel vendor) async => await _vendorRepo.update(vendor);

  @override
  Future<void> delete(VendorModel vendor) async => await _vendorRepo.delete(vendor);

  @override
  StreamSubscription<List<VendorModel>>? initializeStream({
    required RxList<VendorModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    Function(List<VendorModel>)? onNewData,
  }) =>
      _vendorRepo.initializeStream(_companyBusinessLogic.currentCompanyId, startAfter: startAfter, limit: limit).listen(
        (vendorList) {
          startAfter == null ? list$.value = vendorList : list$.addAll(vendorList);
          onNewData?.call(vendorList);
        },
      );
}
