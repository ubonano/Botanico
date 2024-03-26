import 'package:cloud_firestore/cloud_firestore.dart';

import 'enums/worker_role.dart';
import 'worker_model.dart';

class LinkedWorkerModel {
  final String uid;
  final String email;
  final String name;
  final WorkerRole role;

  bool get isOwner => role == WorkerRole.owner;
  bool get isNotOwner => role != WorkerRole.owner;

  LinkedWorkerModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.role,
  });

  LinkedWorkerModel copyWith({
    String? uid,
    String? email,
    String? name,
    WorkerRole? role,
  }) {
    return LinkedWorkerModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'role': workerRoleToString(role),
    };
  }

  factory LinkedWorkerModel.fromMap(Map<String, dynamic> map) {
    return LinkedWorkerModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      role: workerRoleFromString(map['role']),
    );
  }

  static LinkedWorkerModel fromSnapshot(DocumentSnapshot snapshot) {
    return LinkedWorkerModel.fromMap(snapshot.data() as Map<String, dynamic>);
  }

  factory LinkedWorkerModel.fromWorkerModel(WorkerModel worker, WorkerRole role) {
    return LinkedWorkerModel(
      uid: worker.uid,
      email: worker.email,
      name: worker.name,
      role: role,
    );
  }
}
