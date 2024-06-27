import 'package:cloud_firestore/cloud_firestore.dart';

import 'enums/shipment_delivery_place.dart';
import 'enums/shipment_state.dart';
import 'shipment_action_log_model.dart';
export 'enums/shipment_state.dart';
export 'shipment_action_log_model.dart';
export 'enums/shipment_delivery_place.dart';
export 'enums/shipment_type.dart';

class ShipmentModel {
  static const String collectionName = 'shipments';

  final String id;
  final String shipmentId;
  final String type;
  final String client;
  final String package;
  final double weight;
  final String description;
  final ShipmentState state;
  final bool isInvoiced;
  final DateTime createdDateTime;
  final String deliveryPlace;
  final List<ShipmentActionLogModel> actionLogs;

  final DocumentSnapshot? documentSnapshot;

  ShipmentModel({
    this.id = '',
    this.shipmentId = '',
    this.type = '',
    this.client = '',
    this.package = '',
    this.weight = 0.0,
    this.description = '',
    this.state = ShipmentState.pending,
    this.isInvoiced = false,
    DateTime? createdDateTime,
    this.deliveryPlace = '',
    this.actionLogs = const [],
    this.documentSnapshot,
  }) : createdDateTime = createdDateTime ?? DateTime.now();

  Map<String, dynamic> toMap() => {
        'id': id,
        'shipmentId': shipmentId,
        'type': type,
        'client': client,
        'package': package,
        'weight': weight,
        'description': description,
        'state': state.index,
        'isInvoiced': isInvoiced,
        'createdDateTime': createdDateTime,
        'deliveryPlace': deliveryPlace,
        if (actionLogs.isNotEmpty) 'actionLogs': actionLogs.map((e) => e.toMap()).toList(),
      };

  static ShipmentModel fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    List<ShipmentActionLogModel> actionLogs = [];
    if (data['actionLogs'] != null) {
      actionLogs = (data['actionLogs'] as List)
          .map((e) => ShipmentActionLogModel.fromMap(e as Map<String, dynamic>))
          .toList();
    }

    return ShipmentModel(
      id: snapshot.id,
      shipmentId: data['shipmentId'],
      type: data['type'],
      client: data['client'],
      package: data['package'],
      weight: data['weight'],
      description: data['description'],
      state: ShipmentState.values[data['state']],
      isInvoiced: data['isInvoiced'],
      createdDateTime: (data['createdDateTime'] as Timestamp).toDate(),
      deliveryPlace: data['deliveryPlace'],
      actionLogs: actionLogs,
      documentSnapshot: snapshot,
    );
  }

  ShipmentModel copyWith({
    String? id,
    String? shipmentId,
    String? type,
    String? client,
    String? package,
    double? weight,
    String? description,
    ShipmentState? state,
    bool? isInvoiced,
    DateTime? createdDateTime,
    String? deliveryPlace,
    List<ShipmentActionLogModel>? actionLogs,
  }) =>
      ShipmentModel(
        id: id ?? this.id,
        shipmentId: shipmentId ?? this.shipmentId,
        type: type ?? this.type,
        client: client ?? this.client,
        package: package ?? this.package,
        weight: weight ?? this.weight,
        description: description ?? this.description,
        state: state ?? this.state,
        isInvoiced: isInvoiced ?? this.isInvoiced,
        createdDateTime: createdDateTime ?? this.createdDateTime,
        deliveryPlace: deliveryPlace ?? this.deliveryPlace,
        actionLogs: actionLogs ?? this.actionLogs,
      );

  factory ShipmentModel.fromApiResponse(Map<String, dynamic> response) {
    final data = response['ok'][0]['objeto'];

    return ShipmentModel(
      shipmentId: data['numeroEnvio'],
      client: data['nombreDestinatario'],
      weight: (data['kilos'] as num).toDouble(),
      package: data['numeroTotalPiezas'].toString(),
    );
  }

  bool get isPending => state == ShipmentState.pending;
  bool get isInProcess => state == ShipmentState.inProcess;
  bool get isReady => state == ShipmentState.ready;
  bool get isDelivered => state == ShipmentState.delivered;
  bool get isNotInvoiced => !isInvoiced;

  ShipmentModel invoice() => copyWith(isInvoiced: true);
  ShipmentModel cancelInvoice() => copyWith(isInvoiced: false);
  ShipmentModel changeState(ShipmentState state) => copyWith(state: state);
  ShipmentModel changeDeliveryPlace(ShipmentDeliveryPlace deliveryPlace) =>
      copyWith(deliveryPlace: deliveryPlaceToString(deliveryPlace));
}
