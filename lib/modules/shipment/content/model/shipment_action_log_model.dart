import 'package:cloud_firestore/cloud_firestore.dart';

class ShipmentActionLogModel {
  final String action;
  final DateTime timestamp;
  final String user;

  ShipmentActionLogModel({
    required this.action,
    required this.timestamp,
    required this.user,
  });

  Map<String, dynamic> toMap() => {
        'action': action,
        'timestamp': timestamp,
        'user': user,
      };

  factory ShipmentActionLogModel.fromMap(Map<String, dynamic> map) => ShipmentActionLogModel(
        action: map['action'],
        timestamp: (map['timestamp'] as Timestamp).toDate(),
        user: map['user'],
      );
}
