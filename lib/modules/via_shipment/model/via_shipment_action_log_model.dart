import 'package:cloud_firestore/cloud_firestore.dart';

class ViaShipmentActionLogModel {
  final String action;
  final DateTime timestamp;
  final String user;

  ViaShipmentActionLogModel({
    required this.action,
    required this.timestamp,
    required this.user,
  });

  Map<String, dynamic> toMap() => {
        'action': action,
        'timestamp': timestamp,
        'user': user,
      };

  factory ViaShipmentActionLogModel.fromMap(Map<String, dynamic> map) => ViaShipmentActionLogModel(
        action: map['action'],
        timestamp: (map['timestamp'] as Timestamp).toDate(),
        user: map['user'],
      );
}
