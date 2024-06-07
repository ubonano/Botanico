import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../module.dart';

class VendorService extends GetxService with GlobalHelper implements IVendorService {
  late final IVendorBusinessLogic _vendorBusinessLogic = Get.find();

  @override
  Future<VendorModel?> get(String id) async => await _vendorBusinessLogic.get(id);

  @override
  Future<void> create(VendorModel vendor) async => await operation.perform(
        operationName: 'Create vendor ${vendor.uid}',
        permissionKey: VendorModulePermissions.createKey,
        operation: (_) async => await _vendorBusinessLogic.create(vendor),
      );

  @override
  Future<void> update(VendorModel vendor) async => await operation.perform(
        operationName: 'Update vendor ${vendor.uid}',
        permissionKey: VendorModulePermissions.updateKey,
        operation: (_) async => await _vendorBusinessLogic.update(vendor),
      );

  @override
  Future<void> delete(VendorModel vendor) async => await operation.perform(
        operationName: 'Delete vendor ${vendor.uid}',
        permissionKey: VendorModulePermissions.deleteKey,
        operation: (_) async => await _vendorBusinessLogic.delete(vendor),
      );

  @override
  StreamSubscription<List<VendorModel>>? initializeStream({
    required RxList<VendorModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    List<VendorModel>? states,
    Function(List<VendorModel>)? onNewData,
  }) =>
      _vendorBusinessLogic.initializeStream(
        list$: list$,
        startAfter: startAfter,
        limit: limit,
        onNewData: onNewData,
      );
}
