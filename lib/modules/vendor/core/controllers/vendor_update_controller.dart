import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

import '../../module.dart';

class VendorUpdateController extends GetxController with FormHelper, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'VendorUpdateController';

  late final IVendorService _vendorService = Get.find();
  late final VendorModel? _vendorForUpdate;

  dynamic get _vendorId => Get.arguments;

  // TODO agregar campos faltantes... tipo de proveedor, tipo de inscripcion

  @override
  List<String> formFields = [
    FieldKeys.name,
    FieldKeys.address,
    FieldKeys.phone,
    FieldKeys.observations,
  ];

  @override
  Future<void> onInit() async {
    super.onInit();
    _vendorForUpdate = await _vendorService.get(_vendorId);

    if (_vendorForUpdate != null) {
      setFieldValue(FieldKeys.name, _vendorForUpdate.name);
      setFieldValue(FieldKeys.address, _vendorForUpdate.address);
      setFieldValue(FieldKeys.phone, _vendorForUpdate.phone);
      setFieldValue(FieldKeys.observations, _vendorForUpdate.observations);
    }
  }

  @override
  Future<void> submit() async => await _vendorService.updateVendor(_vendor);

  VendorModel get _vendor => VendorModel(
        uid: _vendorForUpdate?.uid ?? '',
        name: getFieldValue(FieldKeys.name),
        address: getFieldValue(FieldKeys.address),
        phone: getFieldValue(FieldKeys.phone),
        observations: getFieldValue(FieldKeys.observations),
      );
}
