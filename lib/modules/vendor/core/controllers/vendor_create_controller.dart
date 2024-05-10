import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

import '../../module.dart';

class VendorCreateController extends GetxController with FormHelper, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'VendorCreateController';

  late final IVendorService _vendorService = Get.find();

  // TODO agregar campos faltantes... tipo de proveedor, tipo de inscripcion

  @override
  List<String> formFields = [
    FieldKeys.name,
    FieldKeys.address,
    FieldKeys.phone,
    FieldKeys.observations,
  ];

  @override
  Future<void> submit() async => await _vendorService.createVendor(_vendor);

  VendorModel get _vendor => VendorModel(
        name: getFieldValue(FieldKeys.name),
        address: getFieldValue(FieldKeys.address),
        phone: getFieldValue(FieldKeys.phone),
        observations: getFieldValue(FieldKeys.observations),
      );
}
