import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../setup/interfaces/i_vendor_business_logic.dart';
import '../setup/interfaces/i_vendor_repository.dart';

class VendorBusinessLogic implements IVendorBusinessLogic {
  late final IVendorRepository _vendorRepo = Get.find();

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
  StreamSubscription<List<VendorModel>>? initStream({
    required RxList<VendorModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    Function(List<VendorModel>)? onNewData,
  }) =>
      _vendorRepo.initStream(startAfter: startAfter, limit: limit).listen(
        (vendorList) {
          startAfter == null ? list$.value = vendorList : list$.addAll(vendorList);
          onNewData?.call(vendorList);
        },
      );
}
