import 'package:cloud_firestore/cloud_firestore.dart';

class ViaShipmentModel {
  final String id;
  final String shipmentId;
  final String type;
  final String client;
  final String package;
  final double weight;
  final String description;
  final String state;
  final bool isInvoiced;
  final DateTime createdDateTime;
  final String deliveryPlace;

  final DocumentSnapshot? documentSnapshot;

  ViaShipmentModel({
    this.id = '',
    this.shipmentId = '',
    this.type = '',
    this.client = '',
    this.package = '',
    this.weight = 0.0,
    this.description = '',
    this.state = '',
    this.isInvoiced = false,
    DateTime? createdDateTime,
    this.deliveryPlace = '',
    this.documentSnapshot,
  }) : createdDateTime = createdDateTime ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
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
    };
  }

  factory ViaShipmentModel.fromMap(
    Map<String, dynamic> map,
    String documentId, [
    DocumentSnapshot? snapshot,
  ]) {
    return ViaShipmentModel(
      id: documentId,
      shipmentId: map['shipmentId'],
      type: map['type'],
      client: map['client'],
      package: map['package'],
      weight: map['weight'],
      description: map['description'],
      state: map['state'],
      isInvoiced: map['isInvoiced'],
      createdDateTime: (map['createdDateTime'] as Timestamp).toDate(),
      deliveryPlace: map['deliveryPlace'],
      documentSnapshot: snapshot,
    );
  }

  static ViaShipmentModel fromSnapshot(DocumentSnapshot snapshot) =>
      ViaShipmentModel.fromMap(snapshot.data() as Map<String, dynamic>, snapshot.id, snapshot);

  ViaShipmentModel copyWith({
    String? id,
    String? shipmentId,
    String? type,
    String? client,
    String? package,
    double? weight,
    String? description,
    String? state,
    bool? isInvoiced,
    DateTime? createdDateTime,
    String? deliveryPlace,
  }) {
    return ViaShipmentModel(
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
    );
  }
}
