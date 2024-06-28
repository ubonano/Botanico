import 'package:cloud_firestore/cloud_firestore.dart';

class ActionLogModel {
  final String action;
  final DateTime timestamp;
  final String user;

  ActionLogModel({
    required this.action,
    required this.timestamp,
    required this.user,
  });

  Map<String, dynamic> toMap() => {
        'action': action,
        'timestamp': timestamp,
        'user': user,
      };

  factory ActionLogModel.fromMap(Map<String, dynamic> map) => ActionLogModel(
        action: map['action'],
        timestamp: (map['timestamp'] as Timestamp).toDate(),
        user: map['user'],
      );
}
