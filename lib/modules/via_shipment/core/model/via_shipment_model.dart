import 'package:cloud_firestore/cloud_firestore.dart';

import '../../module.dart';

class ViaShipmentModel {
  static const String collectionName = 'viaShipments';

  final String id;
  final String shipmentId;
  final String type;
  final String client;
  final String package;
  final double weight;
  final String description;
  final ViaShipmentState state;
  final bool isInvoiced;
  final DateTime createdDateTime;
  final String deliveryPlace;
  final List<ViaShipmentActionLogModel> actionLogs;

  final DocumentSnapshot? documentSnapshot;

  ViaShipmentModel({
    this.id = '',
    this.shipmentId = '',
    this.type = '',
    this.client = '',
    this.package = '',
    this.weight = 0.0,
    this.description = '',
    this.state = ViaShipmentState.pending,
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

  static ViaShipmentModel fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    List<ViaShipmentActionLogModel> actionLogs = [];
    if (data['actionLogs'] != null) {
      actionLogs = (data['actionLogs'] as List)
          .map((e) => ViaShipmentActionLogModel.fromMap(e as Map<String, dynamic>))
          .toList();
    }

    return ViaShipmentModel(
      id: snapshot.id,
      shipmentId: data['shipmentId'],
      type: data['type'],
      client: data['client'],
      package: data['package'],
      weight: data['weight'],
      description: data['description'],
      state: ViaShipmentState.values[data['state']],
      isInvoiced: data['isInvoiced'],
      createdDateTime: (data['createdDateTime'] as Timestamp).toDate(),
      deliveryPlace: data['deliveryPlace'],
      actionLogs: actionLogs,
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
    ViaShipmentState? state,
    bool? isInvoiced,
    DateTime? createdDateTime,
    String? deliveryPlace,
    List<ViaShipmentActionLogModel>? actionLogs,
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

  bool get isPending => state == ViaShipmentState.pending;
  bool get isInProcess => state == ViaShipmentState.inProcess;
  bool get isReady => state == ViaShipmentState.ready;
  bool get isDelivered => state == ViaShipmentState.delivered;
  bool get isNotInvoiced => !isInvoiced;

  ViaShipmentModel invoice() => copyWith(isInvoiced: true);
  ViaShipmentModel cancelInvoice() => copyWith(isInvoiced: false);
  ViaShipmentModel changeState(ViaShipmentState state) => copyWith(state: state);
  ViaShipmentModel changeDeliveryPlace(ViaShipmentDeliveryPlace deliveryPlace) =>
      copyWith(deliveryPlace: deliveryPlaceToString(deliveryPlace));
}
