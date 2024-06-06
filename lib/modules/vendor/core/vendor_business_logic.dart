import 'dart:async';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/worker/module.dart';

import '../module.dart';

class VendorBusinessLogic with GlobalHelper implements IVendorBusinessLogic {
  late final IVendorRepository _vendorRepo = Get.find();
  late final ICompanyBusinessLogic _companyBusinessLogic = Get.find();
  late final IWorkerBusinessLogic _workerBusinessLogic = Get.find();

  final _vendorList$ = RxList<VendorModel>();
  StreamSubscription<List<VendorModel>>? _vendorListSubscription;

  @override
  RxList<VendorModel> get vendorList$ => _vendorList$;

  @override
  Future<VendorModel?> get(String id) async => _vendorRepo.get(id);

  @override
  Future<void> create(VendorModel vendor) async =>
      await _vendorRepo.create(vendor.copyWith(uid: _vendorRepo.generateId));

  @override
  Future<void> update(VendorModel vendor) async => await _vendorRepo.update(vendor);

  @override
  Future<void> delete(String id) async => await _vendorRepo.delete(id);

  @override
  Future<void> postCreate() async => navigate.toVendorList();

  @override
  Future<void> postUpdate() async => navigate.toVendorList();

  @override
  Future<void> initializeStream() async {
    await _workerBusinessLogic.fetchLoggedWorker();
    await _companyBusinessLogic.fetchLoggedCompany();

    _vendorListSubscription = _vendorRepo
        .initializeStream(_companyBusinessLogic.currentCompanyId)
        .listen((workerList) => _vendorList$.value = workerList);
  }

  @override
  void cancelStream() {
    _vendorListSubscription?.cancel();
    _vendorList$.clear();
  }
}
