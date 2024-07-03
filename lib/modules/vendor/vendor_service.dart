import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../app/content/helpers/global_helper.dart';
import 'setup/interfaces/i_vendor_business_logic.dart';
import 'setup/interfaces/i_vendor_service.dart';
import 'setup/module.dart';

class VendorService extends GetxService with GlobalHelper implements IVendorService {
  late final VendorModule _module = Get.find();
  late final IVendorBusinessLogic _vendorBusinessLogic = Get.find();

  @override
  Future<VendorModel?> get(String id) async => await operation.perform(
        operationName: 'Get vendor $id',
        module: _module,
        permissionKey: VendorKeys.view.id,
        operation: (_) async => await _vendorBusinessLogic.get(id),
      );

  @override
  Future<void> create(VendorModel vendor) async => await operation.perform(
        operationName: 'Create vendor ${vendor.uid}',
        module: _module,
        permissionKey: VendorKeys.create.id,
        operation: (_) async => await _vendorBusinessLogic.create(vendor),
      );

  @override
  Future<void> update(VendorModel vendor) async => await operation.perform(
        operationName: 'Update vendor ${vendor.uid}',
        module: _module,
        permissionKey: VendorKeys.update.id,
        operation: (_) async => await _vendorBusinessLogic.update(vendor),
      );

  @override
  Future<void> delete(VendorModel vendor) async => await operation.perform(
        operationName: 'Delete vendor ${vendor.uid}',
        module: _module,
        permissionKey: VendorKeys.delete.id,
        operation: (_) async => await _vendorBusinessLogic.delete(vendor),
      );

  @override
  StreamSubscription<List<VendorModel>>? initStream({
    required RxList<VendorModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    List<VendorModel>? states,
    Function(List<VendorModel>)? onNewData,
  }) =>
      _vendorBusinessLogic.initStream(
        list$: list$,
        startAfter: startAfter,
        limit: limit,
        onNewData: onNewData,
      );
}
