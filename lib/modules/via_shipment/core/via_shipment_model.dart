import 'package:cloud_firestore/cloud_firestore.dart';

import '../module.dart';

class ViaShipmentModel {
  static const String collectionName = 'viaShipments';

  final String id;
  final String shipmentId;
  final String type;
  final String client;
  final String package;
  final double weight;
  final String description;
  final int state;
  final bool isInvoiced;
  final DateTime createdDateTime;
  final String deliveryPlace;
  final List<ActionLogModel> actionLogs;

  final DocumentSnapshot? documentSnapshot;

  ViaShipmentModel({
    this.id = '',
    this.shipmentId = '',
    this.type = '',
    this.client = '',
    this.package = '',
    this.weight = 0.0,
    this.description = '',
    this.state = 0,
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
        'state': state,
        'isInvoiced': isInvoiced,
        'createdDateTime': createdDateTime,
        'deliveryPlace': deliveryPlace,
        'actionLogs': actionLogs.map((e) => e.toMap()).toList(),
      };

  static ViaShipmentModel fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return ViaShipmentModel(
      id: snapshot.id,
      shipmentId: data['shipmentId'],
      type: data['type'],
      client: data['client'],
      package: data['package'],
      weight: data['weight'],
      description: data['description'],
      state: data['state'],
      isInvoiced: data['isInvoiced'],
      createdDateTime: (data['createdDateTime'] as Timestamp).toDate(),
      deliveryPlace: data['deliveryPlace'],
      actionLogs: (data['actionLogs'] as List).map((e) => ActionLogModel.fromMap(e as Map<String, dynamic>)).toList(),
      documentSnapshot: snapshot,
    );
  }

  ViaShipmentModel copyWith({
    String? id,
    String? shipmentId,
    String? type,
    String? client,
    String? package,
    double? weight,
    String? description,
    int? state,
    bool? isInvoiced,
    DateTime? createdDateTime,
    String? deliveryPlace,
    List<ActionLogModel>? actionLogs,
  }) =>
      ViaShipmentModel(
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

  factory ViaShipmentModel.fromApiResponse(Map<String, dynamic> response) {
    final objeto = response['ok'][0]['objeto'];

    return ViaShipmentModel(
      shipmentId: objeto['numeroEnvio'],
      client: objeto['nombreRemitente'],
      weight: (objeto['kilos'] as num).toDouble(),
      package: objeto['numeroTotalPiezas'].toString(),
    );
  }

  bool get isPending => state == ViaShipmentState.pending.index;
  bool get isInProcess => state == ViaShipmentState.inProcess.index;
  bool get isReady => state == ViaShipmentState.ready.index;
  bool get isDelivered => state == ViaShipmentState.delivered.index;
  bool get isNotInvoiced => !isInvoiced;

  ViaShipmentModel invoice() => copyWith(isInvoiced: true);
  ViaShipmentModel cancelInvoice() => copyWith(isInvoiced: false);
  ViaShipmentModel changeState(ViaShipmentState state) => copyWith(state: state.index);
  ViaShipmentModel changeDeliveryPlace(ViaShipmentDeliveryPlace deliveryPlace) =>
      copyWith(deliveryPlace: deliveryPlaceToString(deliveryPlace));
}
