import 'package:cloud_firestore/cloud_firestore.dart';

import 'enums/worker_role.dart';

class WorkerModel {
  final String uid;
  final String email;
  final String name;
  final String birthDate;
  final String phone;
  final String dni;
  String companyId;
  WorkerRole role;
  Map<String, bool> permissions;

  bool get isOwner => role == WorkerRole.owner;
  bool get isNotOwner => role != WorkerRole.owner;
  bool get isEmployee => role == WorkerRole.employee;

  WorkerModel({
    this.uid = '',
    this.email = '',
    required this.name,
    required this.birthDate,
    required this.phone,
    required this.dni,
    this.role = WorkerRole.undefined,
    this.companyId = '',
    this.permissions = const {},
  });

  bool hasPermission(String permissionId) => isOwner || permissions.containsKey(permissionId);

  void togglePermission(String permissionId) {
    if (permissions.containsKey(permissionId) && permissions[permissionId] == true) {
      permissions.remove(permissionId);
    } else {
      permissions[permissionId] = true;
    }
  }

  WorkerModel copyWith({
    String? uid,
    String? email,
    String? name,
    String? birthDate,
    String? phone,
    String? dni,
    String? companyId,
    WorkerRole? role,
    Map<String, bool>? permissions,
  }) =>
      WorkerModel(
        uid: uid ?? this.uid,
        email: email ?? this.email,
        name: name ?? this.name,
        birthDate: birthDate ?? this.birthDate,
        phone: phone ?? this.phone,
        dni: dni ?? this.dni,
        companyId: companyId ?? this.companyId,
        role: role ?? this.role,
        permissions: permissions ?? this.permissions,
      );

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'email': email,
        'name': name,
        'birthDate': birthDate,
        'phone': phone,
        'dni': dni,
        'companyId': companyId,
        'role': workerRoleToString(role),
        'permissions': permissions,
      };

  Map<String, dynamic> toLinkedWorkerMap() => {
        'uid': uid,
        'email': email,
        'name': name,
        'role': workerRoleToString(role),
      };

  static WorkerModel fromSnapshot(DocumentSnapshot snapshot) =>
      WorkerModel.fromMap(snapshot.data() as Map<String, dynamic>);

  factory WorkerModel.fromMap(Map<String, dynamic> map) => WorkerModel(
        uid: map['uid'] ?? '',
        email: map['email'] ?? '',
        name: map['name'] ?? '',
        birthDate: map['birthDate'] ?? '',
        phone: map['phone'] ?? '',
        dni: map['dni'] ?? '',
        companyId: map['companyId'] ?? '',
        role: workerRoleFromString(map['role']),
        permissions: Map<String, bool>.from(map['permissions'] ?? {}),
      );
}
