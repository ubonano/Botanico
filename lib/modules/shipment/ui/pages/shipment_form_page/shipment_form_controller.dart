import 'package:get/get.dart';

import '../../../../app/content/setup/fields_key.dart';
import '../../../../app/content/helpers/form_helper.dart';
import '../../../../app/content/helpers/global_helper.dart';
import '../../../../app/content/helpers/life_cycle_logging_controller_helper.dart';
import '../../../setup/interfaces/i_shipment_service.dart';

class ShipmentFormController extends GetxController
    with FormHelper<ShipmentModel>, GlobalHelper, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'ShipmentFormController';

  late final IShipmentService _shipmentService = Get.find();

  var shipmentType = shipmentTypeToString(ShipmentType.delivery).obs;
  // var shipmentType = ''.obs;
  var shipmentState = ShipmentState.pending.obs;
  var deliveryPlace = deliveryPlaceToString(ShipmentDeliveryPlace.toDefine).obs;
  var isInvoiced = false.obs;
  var isLoading = false.obs;

  var actionLogs = <ActionLogModel>[].obs;

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
    modelForUpdate = await _shipmentService.get(modelId);

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
      actionLogs.value = modelForUpdate!.actionLogs;
    }
  }

  @override
  Future<void> submit() async {
    try {
      isUpdateMode ? await _shipmentService.update(buildModel()) : await _shipmentService.create(buildModel());

      Get.back();
    } catch (e) {
      logTag;
    }
  }

  @override
  ShipmentModel buildModel() {
    return ShipmentModel(
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
      final ShipmentModel? shipment = await _shipmentService.getFromExternalAPI(getFieldValue(FieldKeys.shipmentId));

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
