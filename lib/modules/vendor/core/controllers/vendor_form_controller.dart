import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

import '../../module.dart';

class VendorFormController extends GetxController with FormHelper<VendorModel>, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'VendorFormController';

  late final IVendorService _vendorService = Get.find();

  @override
  List<String> formFields = [
    FieldKeys.name,
    FieldKeys.cuit,
    FieldKeys.address,
    FieldKeys.phone,
    FieldKeys.observations,
    FieldKeys.registrationType,
  ];

  @override
  Future<void> populateFormFields() async {
    modelForUpdate = await _vendorService.get(modelId);

    if (modelForUpdate != null) {
      setFieldValue(FieldKeys.name, modelForUpdate!.name);
      setFieldValue(FieldKeys.cuit, modelForUpdate!.cuit);
      setFieldValue(FieldKeys.address, modelForUpdate!.address);
      setFieldValue(FieldKeys.phone, modelForUpdate!.phone);
      setFieldValue(FieldKeys.observations, modelForUpdate!.observations);
      setFieldValue(FieldKeys.registrationType, modelForUpdate!.registrationType);
    }
  }

  @override
  Future<void> submit() async =>
      isUpdateMode ? await _vendorService.updateVendor(buildModel()) : await _vendorService.createVendor(buildModel());

  @override
  VendorModel buildModel() {
    return VendorModel(
      uid: isUpdateMode ? modelForUpdate!.uid : '',
      name: getFieldValue(FieldKeys.name),
      cuit: getFieldValue(FieldKeys.cuit),
      address: getFieldValue(FieldKeys.address),
      phone: getFieldValue(FieldKeys.phone),
      observations: getFieldValue(FieldKeys.observations),
      registrationType: getFieldValue(FieldKeys.registrationType),
    );
  }
}
