import 'package:botanico/modules/company/module.dart';
import 'package:get/get.dart';

import '../../module.dart';

class ViaShipmentFormController extends GetxController
    with FormHelper<ViaShipmentModel>, GlobalHelper, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'ViaShipmentFormController';

  late final IViaShipmentService _viaShipmentService = Get.find();

  var shipmentType = viaShipmentTypeToString(ViaShipmentType.delivery).obs;
  // var shipmentType = ''.obs;
  var shipmentState = ViaShipmentState.pending.obs;
  var deliveryPlace = deliveryPlaceToString(ViaShipmentDeliveryPlace.toDefine).obs;
  var isInvoiced = false.obs;
  var isLoading = false.obs;

  var actionLogs = <ViaShipmentActionLogModel>[].obs;

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
      shipmentState.value = modelForUpdate!.state;
      deliveryPlace.value = modelForUpdate!.deliveryPlace;
      isInvoiced.value = modelForUpdate!.isInvoiced;
      setFieldValue(FieldKeys.client, modelForUpdate!.client);
      setFieldValue(FieldKeys.package, modelForUpdate!.package);
      setFieldValue(FieldKeys.weight, modelForUpdate!.weight.toString());
      setFieldValue(FieldKeys.description, modelForUpdate!.description);
      setFieldValue(FieldKeys.isInvoiced, modelForUpdate!.isInvoiced.toString());
      setFieldValue(FieldKeys.createdDateTime, modelForUpdate!.createdDateTime.toString());
      actionLogs.value = modelForUpdate!.actionLogs;
    }
  }

  @override
  Future<void> submit() async {
    try {
      isUpdateMode ? await _viaShipmentService.update(buildModel()) : await _viaShipmentService.create(buildModel());

      navigate.back();
    } catch (e) {
      logTag;
    }
  }

  @override
  ViaShipmentModel buildModel() {
    return ViaShipmentModel(
      id: isUpdateMode ? modelForUpdate!.id : '',
      shipmentId: getFieldValue(FieldKeys.shipmentId),
      type: shipmentType.value,
      state: shipmentState.value,
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
    try {
      final ViaShipmentModel? shipment =
          await _viaShipmentService.getFromExternalAPI(getFieldValue(FieldKeys.shipmentId));

      if (shipment != null) {
        setFieldValue(FieldKeys.client, shipment.client);
        setFieldValue(FieldKeys.package, shipment.package);
        setFieldValue(FieldKeys.weight, shipment.weight.toString());
      }
    } catch (e) {
      logTag;
    } finally {
      isLoading.value = false;
    }
  }
}
