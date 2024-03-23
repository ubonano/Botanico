import 'package:cloud_firestore/cloud_firestore.dart';

class WorkerModel {
  final String uid;
  final String email;
  final String name;
  final String birthDate;
  final String phone;
  final String dni;
  final String companyId;
  final Map<String, bool> permissions;

  WorkerModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.birthDate,
    required this.phone,
    required this.dni,
    this.companyId = '',
    this.permissions = const {},
  });

  bool hasPermission(String permissionId) {
    return permissions[permissionId] ?? false;
  }

  WorkerModel copyWith({
    String? uid,
    String? email,
    String? name,
    String? birthDate,
    String? phone,
    String? dni,
    String? companyId,
    Map<String, bool>? permissions,
  }) {
    return WorkerModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      birthDate: birthDate ?? this.birthDate,
      phone: phone ?? this.phone,
      dni: dni ?? this.dni,
      companyId: companyId ?? this.companyId,
      permissions: permissions ?? this.permissions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'birthDate': birthDate,
      'phone': phone,
      'dni': dni,
      'companyId': companyId,
      'permissions': permissions, // Añadir los permisos al mapa
    };
  }

  static WorkerModel fromSnapshot(DocumentSnapshot snapshot) {
    return WorkerModel.fromMap(snapshot.data() as Map<String, dynamic>);
  }

  factory WorkerModel.fromMap(Map<String, dynamic> map) {
    return WorkerModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      birthDate: map['birthDate'] ?? '',
      phone: map['phone'] ?? '',
      dni: map['dni'] ?? '',
      companyId: map['companyId'] ?? '',
      permissions: Map<String, bool>.from(map['permissions'] ?? {}), // Convertir los permisos
    );
  }
}
