import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

import '../../module.dart';

class ViaShipmentFormController extends GetxController
    with FormHelper<ViaShipmentModel>, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'ViaShipmentFormController';

  late final IViaShipmentService _viaShipmentService = Get.find();

  var shipmentType = ''.obs;
  var shipmentState = ViaShipmentState.pending.obs;
  var deliveryPlace = ''.obs;
  var isInvoiced = false.obs;
  var isLoading = false.obs;
  
  @override
  List<String> formFields = [
    FieldKeys.shipmentId,
    FieldKeys.type,
    FieldKeys.client,
    FieldKeys.package,
    FieldKeys.weight,
    FieldKeys.description,
    FieldKeys.state,
    FieldKeys.isInvoiced,
    FieldKeys.createdDateTime,
    FieldKeys.deliveryPlace,
  ];

  @override
  Future<void> populateFormFields() async {
    modelForUpdate = await _viaShipmentService.get(modelId);

    if (modelForUpdate != null) {
      setFieldValue(FieldKeys.shipmentId, modelForUpdate!.shipmentId);
      shipmentType.value = modelForUpdate!.type;
      shipmentState.value = ViaShipmentState.values[modelForUpdate!.state];
      deliveryPlace.value = modelForUpdate!.deliveryPlace;
      isInvoiced.value = modelForUpdate!.isInvoiced;
      setFieldValue(FieldKeys.client, modelForUpdate!.client);
      setFieldValue(FieldKeys.package, modelForUpdate!.package);
      setFieldValue(FieldKeys.weight, modelForUpdate!.weight.toString());
      setFieldValue(FieldKeys.description, modelForUpdate!.description);
      setFieldValue(FieldKeys.isInvoiced, modelForUpdate!.isInvoiced.toString());
      setFieldValue(FieldKeys.createdDateTime, modelForUpdate!.createdDateTime.toString());
    }
  }

  @override
  Future<void> submit() async => isUpdateMode
      ? await _viaShipmentService.updateViaShipment(buildModel())
      : await _viaShipmentService.createViaShipment(buildModel());

  @override
  ViaShipmentModel buildModel() {
    return ViaShipmentModel(
      id: isUpdateMode ? modelForUpdate!.id : '',
      shipmentId: getFieldValue(FieldKeys.shipmentId),
      type: shipmentType.value,
      state: shipmentState.value.index,
      deliveryPlace: deliveryPlace.value,
      isInvoiced: isInvoiced.value,
      client: getFieldValue(FieldKeys.client),
      package: getFieldValue(FieldKeys.package),
      weight: double.parse(getFieldValue(FieldKeys.weight)),
      description: getFieldValue(FieldKeys.description),
      createdDateTime: isUpdateMode ? modelForUpdate!.createdDateTime : DateTime.now(),
    );
  }

  Future<void> fetchShipmentDataFromExternalAPI() async {
    isLoading.value = true;
    final ViaShipmentModel? shipment =
        await _viaShipmentService.getShipmentFromExternalAPI(getFieldValue(FieldKeys.shipmentId));
    isLoading.value = false;

    if (shipment != null) {
      setFieldValue(FieldKeys.client, shipment.client);
      setFieldValue(FieldKeys.package, shipment.package);
      setFieldValue(FieldKeys.weight, shipment.weight.toString());
    }
  }
}
